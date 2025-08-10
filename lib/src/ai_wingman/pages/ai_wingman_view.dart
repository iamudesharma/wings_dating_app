import 'package:auto_route/auto_route.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/ai_wingman/providers/gemma_provider.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/model_selection_screen.dart';
import 'package:wings_dating_app/src/ai_wingman/services/model_download_service.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/enhanced_wingman_header.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/enhanced_dating_suggestions.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/enhanced_welcome_section.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/dating_info_panel.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/modern_chat_message.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/modern_chat_input.dart';
import 'package:wings_dating_app/src/users/users_view.dart';

@RoutePage(name: 'AIChatRoute')
class AIChatScreen extends ConsumerStatefulWidget {
  const AIChatScreen({
    super.key,
    this.model = Model.gemma3GpuLocalAsset,
  });

  final Model model;
  @override
  ConsumerState<AIChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<AIChatScreen> {
  final _messages = <Message>[];
  String? _error;
  String _appTitle = 'AI Dating Wingman 💕';

  // Mobile-only platforms for model download/selection
  bool get _isAndroidOrIOS => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  // Define dating-focused tools
  final List<Tool> _tools = [
    const Tool(
      name: 'analyze_dating_profile',
      description: 'Analyzes a dating profile photo or bio and provides improvement suggestions',
      parameters: {
        'type': 'object',
        'properties': {
          'analysis_type': {
            'type': 'string',
            'description': 'Type of analysis: photo, bio, or overall',
            'enum': ['photo', 'bio', 'overall'],
          },
          'suggestions': {
            'type': 'string',
            'description': 'Specific suggestions for improvement',
          },
        },
        'required': ['analysis_type', 'suggestions'],
      },
    ),
    const Tool(
      name: 'generate_conversation_starter',
      description: 'Generates personalized conversation starters based on profile information',
      parameters: {
        'type': 'object',
        'properties': {
          'context': {
            'type': 'string',
            'description': 'Context about the person (interests, bio, photos)',
          },
          'starter_type': {
            'type': 'string',
            'description': 'Type of conversation starter',
            'enum': ['humorous', 'thoughtful', 'casual', 'creative'],
          },
        },
        'required': ['context', 'starter_type'],
      },
    ),
    const Tool(
      name: 'suggest_date_ideas',
      description: 'Suggests date ideas based on preferences, budget, and location',
      parameters: {
        'type': 'object',
        'properties': {
          'budget': {
            'type': 'string',
            'description': 'Budget range for the date',
            'enum': ['low', 'medium', 'high', 'any'],
          },
          'date_type': {
            'type': 'string',
            'description': 'Type of date preferred',
            'enum': ['casual', 'romantic', 'adventurous', 'cultural', 'outdoor'],
          },
          'location': {
            'type': 'string',
            'description': 'General location or setting',
          },
        },
        'required': ['budget', 'date_type'],
      },
    ),
    const Tool(
      name: 'confidence_boost',
      description: 'Provides confidence-building advice and positive affirmations for dating',
      parameters: {
        'type': 'object',
        'properties': {
          'situation': {
            'type': 'string',
            'description': 'The dating situation needing confidence boost',
          },
          'advice_type': {
            'type': 'string',
            'description': 'Type of advice needed',
            'enum': ['pre_date', 'messaging', 'profile_creation', 'general'],
          },
        },
        'required': ['situation', 'advice_type'],
      },
    ),
    const Tool(
      name: 'red_flag_detector',
      description: 'Identifies potential red flags in dating conversations or profiles',
      parameters: {
        'type': 'object',
        'properties': {
          'content': {
            'type': 'string',
            'description': 'The conversation or profile content to analyze',
          },
          'flag_level': {
            'type': 'string',
            'description': 'Severity level of the red flag',
            'enum': ['minor', 'moderate', 'major'],
          },
          'explanation': {
            'type': 'string',
            'description': 'Explanation of why this is a red flag',
          },
        },
        'required': ['content', 'flag_level', 'explanation'],
      },
    ),
    const Tool(
      name: 'relationship_advice',
      description: 'Provides advice for different stages of dating and relationships',
      parameters: {
        'type': 'object',
        'properties': {
          'stage': {
            'type': 'string',
            'description': 'Stage of dating/relationship',
            'enum': ['initial_contact', 'first_dates', 'getting_serious', 'long_term'],
          },
          'situation': {
            'type': 'string',
            'description': 'Specific situation or challenge',
          },
        },
        'required': ['stage', 'situation'],
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    // On mobile, if the selected model isn't available locally, redirect to selection/download
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isAndroidOrIOS) {
        _maybeRedirectForMobile();
      }
    });
    _initializeGemmaProvider();
  }

  Future<void> _maybeRedirectForMobile() async {
    if (!_isAndroidOrIOS) return;
    final model = widget.model;
    if (model.localModel) return;
    final downloader = ModelDownloadService(
      modelUrl: model.url,
      modelFilename: model.filename,
      licenseUrl: model.licenseUrl,
    );
    final exists = await downloader.existsLocally();
    if (!exists && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const ModelSelectionScreen(),
        ),
      );
    }
  }

  Future<void> _initializeGemmaProvider() async {
    await ref.read(gemmaProvider.notifier).initialize(widget.model, _tools);
    setState(() {});
  }

  InferenceChat? get chat => ref.watch(gemmaProvider);
  bool get isModelInitialized => ref.read(gemmaProvider.notifier).isModelInitialized;

  // Helper method to handle function calls with system messages (async version)
  Future<void> _handleFunctionCall(FunctionCallResponse functionCall) async {
    debugPrint('Function call received: ${functionCall.name}(${functionCall.args})');

    // 1. Show "Calling function..."
    setState(() {
      _messages.add(Message.systemInfo(
        text:
            "🔧 Calling: ${functionCall.name}(${functionCall.args.entries.map((e) => '${e.key}: \"${e.value}\"').join(', ')})",
      ));
    });

    // Small delay to show the calling message
    await Future.delayed(const Duration(milliseconds: 300));

    // 2. Show "Executing function"
    setState(() {
      _messages.add(Message.systemInfo(
        text: "⚡ Executing function",
      ));
    });

    final toolResponse = await _executeTool(functionCall);
    debugPrint('Tool response: $toolResponse');

    // 3. Show "Function completed"
    setState(() {
      _messages.add(Message.systemInfo(
        text: "✅ Function completed: ${toolResponse['message'] ?? 'Success'}",
      ));
    });

    // Small delay to show completion
    await Future.delayed(const Duration(milliseconds: 300));

    // Send tool response back to the model
    final toolMessage = Message.toolResponse(
      toolName: functionCall.name,
      response: toolResponse,
    );
    await chat?.addQuery(toolMessage);

    // Get the final response from the model (async stream)
    debugPrint('Getting async response from model...');

    String accumulatedResponse = '';
    bool hasStartedResponse = false;

    await for (final token in chat!.generateChatResponseAsync()) {
      if (token is TextResponse) {
        // Получаем токен
        accumulatedResponse += token.token;

        setState(() {
          if (!hasStartedResponse) {
            // First token - add new message
            _messages.add(Message.text(text: accumulatedResponse));
            hasStartedResponse = true;
          } else {
            // Update existing message
            final lastIndex = _messages.length - 1;
            _messages[lastIndex] = Message.text(text: accumulatedResponse);
          }
        });
      } else if (token is FunctionCallResponse) {
        // Не должно случаться после tool response
        debugPrint('Unexpected FunctionCall after tool response: ${token.name}');
      }
    }

    debugPrint('Final accumulated response: $accumulatedResponse');
  }

  // Function to execute tools
  Future<Map<String, dynamic>> _executeTool(FunctionCallResponse functionCall) async {
    switch (functionCall.name) {
      case 'analyze_dating_profile':
        final analysisType = functionCall.args['analysis_type'] as String?;
        final suggestions = functionCall.args['suggestions'] as String?;

        return {
          'status': 'success',
          'analysis_type': analysisType,
          'suggestions': suggestions,
          'message':
              'Profile analysis completed successfully! Here are personalized suggestions to improve your dating profile.',
        };

      case 'generate_conversation_starter':
        final context = functionCall.args['context'] as String?;
        final starterType = functionCall.args['starter_type'] as String?;

        return {
          'status': 'success',
          'context': context,
          'starter_type': starterType,
          'message': 'Generated personalized conversation starters based on the profile information.',
        };

      case 'suggest_date_ideas':
        final budget = functionCall.args['budget'] as String?;
        final dateType = functionCall.args['date_type'] as String?;
        final location = functionCall.args['location'] as String?;

        return {
          'status': 'success',
          'budget': budget,
          'date_type': dateType,
          'location': location,
          'message': 'Date ideas generated based on your preferences and budget!',
        };

      case 'confidence_boost':
        final situation = functionCall.args['situation'] as String?;
        final adviceType = functionCall.args['advice_type'] as String?;

        return {
          'status': 'success',
          'situation': situation,
          'advice_type': adviceType,
          'message': 'Confidence boost advice provided! You\'ve got this! 💪',
        };

      case 'red_flag_detector':
        final content = functionCall.args['content'] as String?;
        final flagLevel = functionCall.args['flag_level'] as String?;
        final explanation = functionCall.args['explanation'] as String?;

        return {
          'status': 'success',
          'content': content,
          'flag_level': flagLevel,
          'explanation': explanation,
          'message': 'Red flag analysis completed. Stay safe out there! 🚩',
        };

      case 'relationship_advice':
        final stage = functionCall.args['stage'] as String?;
        final situation = functionCall.args['situation'] as String?;

        return {
          'status': 'success',
          'stage': stage,
          'situation': situation,
          'message': 'Relationship advice provided for your current dating stage.',
        };

      default:
        return {'error': 'Unknown tool: ${functionCall.name}'};
    }
  }

  // Process user message and get AI response
  Future<void> _processMessage(Message message) async {
    if (chat == null) return;

    try {
      await chat!.addQuery(message);

      String accumulatedResponse = '';
      bool hasStartedResponse = false;

      await for (final token in chat!.generateChatResponseAsync()) {
        if (token is TextResponse) {
          // Handle text response
          accumulatedResponse += token.token;

          setState(() {
            if (!hasStartedResponse) {
              // First token - add new AI message
              _messages.add(Message.text(text: accumulatedResponse));
              hasStartedResponse = true;
            } else {
              // Update existing AI message
              final lastIndex = _messages.length - 1;
              _messages[lastIndex] = Message.text(text: accumulatedResponse);
            }
          });
        } else if (token is FunctionCallResponse) {
          // Handle function call
          await _handleFunctionCall(token);
        }
      }
    } catch (e) {
      setState(() {
        _error = 'Error processing message: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // On mobile (non-web), show a clear entry point to select/download models
      floatingActionButton: _isAndroidOrIOS
          ? FloatingActionButton.extended(
              heroTag: 'modelsFab',
              icon: const Icon(Icons.model_training),
              label: const Text('Models'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ModelSelectionScreen(),
                  ),
                );
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Row(
            children: [
              // Always show navigation bar (previously only showed when isWide was true)
              NavigationBarWidget(sizingInformation: sizingInformation),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.background,
                        Theme.of(context).colorScheme.surface.withOpacity(0.2),
                        Theme.of(context).colorScheme.background,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        // Modern header with enhanced styling
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: EnhancedWingmanHeader(
                            chat: chat,
                            appTitle: _appTitle,
                            isOnline: isModelInitialized,
                            onModelSelection: () {
                              if (_isAndroidOrIOS) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (context) => const ModelSelectionScreen(),
                                  ),
                                  (route) => false,
                                );
                              } else {
                                // No-op on non-mobile; models are asset-only on web/desktop
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Model selection is available on Android/iOS only.')),
                                );
                              }
                            },
                            onOpenSettings: () => _openSettingsSheet(context),
                          ),
                        ),

                        // Error banner
                        if (_error != null) _buildModernErrorBanner(_error!),

                        // Main content
                        Expanded(
                          child: isModelInitialized ? _buildChatInterface() : _buildLoadingState(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openSettingsSheet(BuildContext context) {
    final notifier = ref.read(gemmaProvider.notifier);
    final currentTemp = notifier.temperature;
    final currentTopK = notifier.topK;
    final currentTopP = notifier.topP;
    final currentFC = notifier.supportsFunctionCallsEnabled;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        double temp = currentTemp;
        double topP = currentTopP;
        double topK = currentTopK.toDouble();
        bool fc = currentFC;

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: StatefulBuilder(
            builder: (context, setStateSB) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'AI Wingman Settings',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Temperature
                  Text('Creativity (temperature): ${temp.toStringAsFixed(2)}'),
                  Slider(
                    min: 0.0,
                    max: 2.0,
                    divisions: 40,
                    value: temp,
                    onChanged: (v) => setStateSB(() => temp = v),
                  ),
                  const SizedBox(height: 8),

                  // topK
                  Text('Top-K: ${topK.round()}'),
                  Slider(
                    min: 1,
                    max: 128,
                    divisions: 127,
                    value: topK,
                    onChanged: (v) => setStateSB(() => topK = v),
                  ),
                  const SizedBox(height: 8),

                  // topP
                  Text('Top-P: ${topP.toStringAsFixed(2)}'),
                  Slider(
                    min: 0.1,
                    max: 1.0,
                    divisions: 90,
                    value: topP,
                    onChanged: (v) => setStateSB(() => topP = v),
                  ),
                  const SizedBox(height: 8),

                  // function calls
                  Row(
                    children: [
                      Switch(value: fc, onChanged: (v) => setStateSB(() => fc = v)),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Enable function calls (if model supports)')),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          label: const Text('Apply'),
                          onPressed: () async {
                            Navigator.of(ctx).pop();
                            await ref.read(gemmaProvider.notifier).updateSettings(
                                  temperature: temp,
                                  topK: topK.round(),
                                  topP: topP,
                                  supportsFunctionCalls: fc,
                                );
                            setState(() {}); // refresh UI badges
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildChatInterface() {
    return Column(
      children: [
        // Dating suggestions when no messages
        if (_messages.isEmpty) ...[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  EnhancedWelcomeSection(),
                  SizedBox(height: 20),
                  EnhancedDatingSuggestionsWidget(
                    onSuggestionTap: (suggestion) {
                      final message = Message.text(text: suggestion, isUser: true);
                      setState(() {
                        _error = null;
                        _messages.add(message);
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DatingInfoPanel(),
                  SizedBox(height: 20),
                  DatingFactsCarousel(),
                  SizedBox(height: 20),
                  if (chat?.supportsImages == true) _buildImageSupportInfo(),
                ],
              ),
            ),
          ),
        ] else ...[
          // Chat messages
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages.reversed.toList()[index];
                return ModernChatMessage(message: message);
              },
            ),
          ),
        ],

        // Modern input
        ModernChatInput(
          onMessageSent: (message) async {
            setState(() {
              _error = null;
              _messages.add(message);
            });

            // Process the message with AI
            await _processMessage(message);
          },
          supportsImages: chat?.supportsImages ?? false,
        ),
      ],
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 40,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Initializing your AI Wingman...',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Getting ready to help with your dating journey!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernErrorBanner(String errorMessage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.error.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.error.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSupportInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
            child: Icon(
              Icons.photo_camera,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Photo Analysis Available! 📸',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Upload dating profile photos for personalized feedback and improvement tips',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        height: 1.3,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
