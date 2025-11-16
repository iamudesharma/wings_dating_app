import 'package:flutter/foundation.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';

/// Installs the provided [model] (if necessary) and returns a ready-to-use
/// [InferenceChat] instance configured with the supplied generation settings.
Future<InferenceChat> installModelAndCreateChat({
  required Model model,
  required double temperature,
  required int topK,
  required double topP,
  required bool supportsFunctionCalls,
  required List<Tool> tools,
}) async {
  final installer = FlutterGemma.installModel(
    modelType: model.modelType,
    fileType: model.fileType,
  );
 

  if (model.localModel) {
    await installer.fromAsset(model.baseUrl).install();
  } else {
    await installer.fromNetwork(model.url).install();
  }

  final activeModel = await FlutterGemma.getActiveModel(
    maxTokens: model.maxTokens,
    preferredBackend: model.preferredBackend,
    supportImage: model.supportImage,
    maxNumImages: model.maxNumImages,
  );

  return activeModel.createChat(
    temperature: temperature,
    randomSeed: 1,
    topK: topK,
    topP: topP,
    tokenBuffer: 256,
    supportImage: model.supportImage,
    supportsFunctionCalls: supportsFunctionCalls,
    tools: tools,
    isThinking: model.isThinking,
    modelType: model.modelType,
  );
}

class GemmaLocalService {
  final InferenceChat _chat;

  GemmaLocalService(this._chat);

  Future<void> addQuery(Message message) => _chat.addQueryChunk(message);

  /// Process message and return stream - back to direct streaming!
  Future<Stream<ModelResponse>> processMessage(Message message) async {
    debugPrint(
        'GemmaLocalService: processMessage() called with: "${message.text}"');
    debugPrint('GemmaLocalService: Adding query to chat: "${message.text}"');
    await _chat.addQueryChunk(message);
    debugPrint(
        'GemmaLocalService: Using direct InferenceChat stream (function handling: integrated)');

    // Return direct stream from InferenceChat - no more intermediate processing!
    return _chat.generateChatResponseAsync();
  }

  /// Legacy method for backward compatibility
  Stream<ModelResponse> processMessageAsync(Message message) async* {
    await _chat.addQuery(message);
    yield* _chat.generateChatResponseAsync();
  }
}
