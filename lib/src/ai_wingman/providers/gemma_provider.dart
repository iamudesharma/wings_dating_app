import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/ai_wingman/services/model_download_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// GemmaProvider manages a single instance of InferenceChat for the selected model.
final gemmaProvider = StateNotifierProvider<GemmaNotifier, InferenceChat?>((ref) => GemmaNotifier());

class GemmaNotifier extends StateNotifier<InferenceChat?> {
  GemmaNotifier() : super(null);

  Model _currentModel = Model.gemma3_270M;
  List<Tool> _tools = [];
  bool _isModelInitialized = false;

  // Runtime-adjustable chat settings (initialized from model defaults)
  double _temperature = 0.7;
  int _topK = 40;
  double _topP = 0.95;
  bool _supportsFunctionCalls = false;

  Model get currentModel => _currentModel;
  bool get isModelInitialized => _isModelInitialized;

  // Expose current settings for UI
  double get temperature => _temperature;
  int get topK => _topK;
  double get topP => _topP;
  bool get supportsFunctionCallsEnabled => _supportsFunctionCalls;

  Future<void> initialize(Model model, List<Tool> tools) async {
    _tools = tools;
    _currentModel = model;
    final gemma = FlutterGemmaPlugin.instance;

    // Initialize runtime settings from model defaults
    _temperature = model.temperature;
    _topK = model.topK;
    _topP = model.topP;
    _supportsFunctionCalls = model.supportsFunctionCalls;

    // Resolve model path per platform, and only initialize when available on Android/iOS
    final resolvedPath = await _resolveModelPath(model);
    if (resolvedPath == null) {
      // No local model available on Android/iOS yet — don't initialize chat
      state = null;
      _isModelInitialized = false;
      return;
    }

    // Ensure model path is set for the plugin
    await gemma.modelManager.setModelPath(resolvedPath);

    // Persist resolved path for future sessions (mobile only). Safe to ignore failures.
    await _persistModelPathIfNeeded(model, resolvedPath);

    final gemmaModel = await gemma.createModel(
      modelType: model.modelType,
      preferredBackend: model.preferredBackend,
      maxTokens: model.maxTokens,
      supportImage: model.supportImage,
      maxNumImages: model.maxNumImages,
    );

    final chat = await gemmaModel.createChat(
      temperature: _temperature,
      randomSeed: 1,
      topK: _topK,
      topP: _topP,
      tokenBuffer: 256,
      supportImage: model.supportImage,
      supportsFunctionCalls: _supportsFunctionCalls && model.supportsFunctionCalls,
      tools: tools,
    );

    state = chat;
    _isModelInitialized = true;
  }

  // Compute the correct model path for current platform.
  // Returns null on Android/iOS if a non-asset model isn't downloaded yet.
  Future<String?> _resolveModelPath(Model model) async {
    // Web uses bundled asset url/path
    if (kIsWeb) return model.url;

    // Desktop platforms (macOS/Windows/Linux): keep using asset-only behavior
    // If local asset, use asset path; otherwise, return null to prevent init (mobile-only feature)
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return model.localModel ? model.url : null;
    }

    // Android/iOS: if local asset model, use asset path; else require downloaded file
    if (Platform.isAndroid || Platform.isIOS) {
      if (model.localModel) return model.url;

      // 1. Try persisted path first
      final persisted = await _getPersistedModelPath(model);
      if (persisted != null) {
        final file = File(persisted);
        if (await file.exists()) return persisted;
      }

      // 2. Expected default documents directory path
      final docsDir = await getApplicationDocumentsDirectory();
      final expectedPath = '${docsDir.path}/${model.filename}';
      final expectedFile = File(expectedPath);
      if (await expectedFile.exists()) {
        await _persistModelPathIfNeeded(model, expectedPath);
        return expectedPath;
      }

      // 3. Fallback: ask downloader service (may perform additional checks)
      final downloader = ModelDownloadService(
        modelUrl: model.url,
        modelFilename: model.filename,
        licenseUrl: model.licenseUrl,
      );
      final exists = await downloader.existsLocally();
      if (exists) {
        await _persistModelPathIfNeeded(model, expectedPath);
        return expectedPath;
      }
      return null; // not available yet
    }

    // Fallback: do not initialize
    return null;
  }

  // Update chat settings and rebuild the chat instance
  Future<void> updateSettings({
    double? temperature,
    int? topK,
    double? topP,
    bool? supportsFunctionCalls,
  }) async {
    // Store new values (fallback to old)
    if (temperature != null) _temperature = temperature;
    if (topK != null) _topK = topK;
    if (topP != null) _topP = topP;
    if (supportsFunctionCalls != null) {
      // Only enable if model supports
      _supportsFunctionCalls = supportsFunctionCalls && _currentModel.supportsFunctionCalls;
    }

    // Recreate model+chat using current model and tools
    final gemma = FlutterGemmaPlugin.instance;

    // Ensure valid model path before recreating chat
    final resolvedPath = await _resolveModelPath(_currentModel);
    if (resolvedPath == null) {
      // No model available (Android/iOS without downloaded file). Keep state as-is.
      return;
    }
    await gemma.modelManager.setModelPath(resolvedPath);

    // Persist again (in case it changed)
    await _persistModelPathIfNeeded(_currentModel, resolvedPath);

    final gemmaModel = await gemma.createModel(
      modelType: _currentModel.modelType,
      preferredBackend: _currentModel.preferredBackend,
      maxTokens: _currentModel.maxTokens,
      supportImage: _currentModel.supportImage,
      maxNumImages: _currentModel.maxNumImages,
    );

    final chat = await gemmaModel.createChat(
      temperature: _temperature,
      randomSeed: 1,
      topK: _topK,
      topP: _topP,
      tokenBuffer: 256,
      supportImage: _currentModel.supportImage,
      supportsFunctionCalls: _supportsFunctionCalls && _currentModel.supportsFunctionCalls,
      tools: _tools,
    );

    state = chat;
  }

  void disposeChat() {
    state = null;
    _isModelInitialized = false;
  }

  // -------------------------------------------------------------------------
  // Persistence helpers (mobile only)
  // -------------------------------------------------------------------------
  String _prefsKeyForModel(Model model) => 'gemma_model_path_${model.filename}';

  Future<void> _persistModelPathIfNeeded(Model model, String path) async {
    if (kIsWeb) return;
    if (!(Platform.isAndroid || Platform.isIOS)) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final existing = prefs.getString(_prefsKeyForModel(model));
      if (existing != path) {
        await prefs.setString(_prefsKeyForModel(model), path);
      }
    } catch (_) {
      // Ignore persistence errors
    }
  }

  Future<String?> _getPersistedModelPath(Model model) async {
    if (kIsWeb) return null;
    if (!(Platform.isAndroid || Platform.isIOS)) return null;
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_prefsKeyForModel(model));
    } catch (_) {
      return null;
    }
  }
}
