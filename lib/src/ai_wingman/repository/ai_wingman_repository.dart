// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wings_dating_app/helpers/logger.dart';
// import 'package:wings_dating_app/src/ai_wingman/models/ai_message.dart';
// import 'package:wings_dating_app/src/ai_wingman/models/wingman_context.dart';
// import 'package:wings_dating_app/src/ai_wingman/services/ai_wingman_service.dart';

// class AIWingmanRepository {
//   final AIWingmanService _aiService;
//   static const String _conversationHistoryKey = 'ai_wingman_conversation_history';
//   static const String _userContextKey = 'ai_wingman_user_context';

//   AIWingmanRepository(this._aiService);

//   // Chat conversation methods
//   Future<List<AIMessage>> getConversationHistory() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final historyJson = prefs.getString(_conversationHistoryKey);

//       if (historyJson == null) return [];

//       final List<dynamic> historyList = json.decode(historyJson);
//       return historyList.map((json) => AIMessage.fromJson(json)).toList();
//     } catch (e) {
//       logger.e('Error loading conversation history: $e');
//       return [];
//     }
//   }

//   Future<void> saveConversationHistory(List<AIMessage> messages) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final historyJson = json.encode(messages.map((m) => m.toJson()).toList());
//       await prefs.setString(_conversationHistoryKey, historyJson);
//     } catch (e) {
//       logger.e('Error saving conversation history: $e');
//     }
//   }

//   Future<void> addMessageToHistory(AIMessage message) async {
//     final history = await getConversationHistory();
//     history.add(message);

//     // Keep only last 100 messages to prevent storage bloat
//     if (history.length > 100) {
//       history.removeRange(0, history.length - 100);
//     }

//     await saveConversationHistory(history);
//   }

//   Future<void> clearConversationHistory() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove(_conversationHistoryKey);
//     } catch (e) {
//       logger.e('Error clearing conversation history: $e');
//     }
//   }

//   // User context methods
//   Future<WingmanContext?> getUserContext() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final contextJson = prefs.getString(_userContextKey);

//       if (contextJson == null) return null;

//       return WingmanContext.fromJson(json.decode(contextJson));
//     } catch (e) {
//       logger.e('Error loading user context: $e');
//       return null;
//     }
//   }

//   Future<void> saveUserContext(WingmanContext context) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final contextJson = json.encode(context.toJson());
//       await prefs.setString(_userContextKey, contextJson);
//     } catch (e) {
//       logger.e('Error saving user context: $e');
//     }
//   }

//   // AI service methods
//   Future<String> generateAIResponse(AIRequest request) async {
//     return await _aiService.generateResponse(request);
//   }

//   Future<List<String>> getQuickSuggestions(AIResponseType responseType, {WingmanContext? context}) async {
//     return await _aiService.generateQuickSuggestions(responseType, context: context);
//   }

//   Future<void> initializeAIService() async {
//     await _aiService.initialize();
//   }

//   // Utility methods
//   String generateMessageId() {
//     return DateTime.now().millisecondsSinceEpoch.toString();
//   }

//   AIMessage createUserMessage(String content, {AIResponseType? responseType, String? context}) {
//     return AIMessage(
//       id: generateMessageId(),
//       content: content,
//       isUser: true,
//       timestamp: DateTime.now(),
//       responseType: responseType,
//       context: context,
//     );
//   }

//   AIMessage createAIMessage(String content, {AIResponseType? responseType, String? context}) {
//     return AIMessage(
//       id: generateMessageId(),
//       content: content,
//       isUser: false,
//       timestamp: DateTime.now(),
//       responseType: responseType,
//       context: context,
//     );
//   }
// }
