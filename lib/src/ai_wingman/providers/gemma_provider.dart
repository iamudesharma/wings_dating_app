
import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_gemma/core/tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/ai_wingman/services/gemma_model_manager.dart';

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
    _currentModel = model;
    _tools = tools;

    _temperature = model.temperature;
    _topK = model.topK;
    _topP = model.topP;
    _supportsFunctionCalls = model.supportsFunctionCalls;

    state = await installModelAndCreateChat(
      model: _currentModel,
      temperature: _temperature,
      topK: _topK,
      topP: _topP,
      supportsFunctionCalls: _supportsFunctionCalls && _currentModel.supportsFunctionCalls,
      tools: _tools,
    );
    _isModelInitialized = true;
  }

  // Compute the correct model path for current platform.
  // Returns null on Android/iOS if a non-asset model isn't downloaded yet.
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

    // Ensure valid model path before recreating chat

    // state = chat;
  }

  void disposeChat() {
    state = null;
    _isModelInitialized = false;
  }
}
