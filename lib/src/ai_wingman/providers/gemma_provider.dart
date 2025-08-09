import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';

/// GemmaProvider manages a single instance of InferenceChat for the selected model.
final gemmaProvider = StateNotifierProvider<GemmaNotifier, InferenceChat?>((ref) => GemmaNotifier());

class GemmaNotifier extends StateNotifier<InferenceChat?> {
  GemmaNotifier() : super(null);

  Model _currentModel = Model.gemma3GpuLocalAsset;
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

    // Check if model is installed
    if (!await gemma.modelManager.isModelInstalled) {
      final path = model.localModel ? model.url : model.filename;
      await gemma.modelManager.setModelPath(path);
    }

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

    // Ensure model path is set (avoid reinstall if already set)
    if (!await gemma.modelManager.isModelInstalled) {
      final path = _currentModel.localModel ? _currentModel.url : _currentModel.filename;
      await gemma.modelManager.setModelPath(path);
    }

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
}
