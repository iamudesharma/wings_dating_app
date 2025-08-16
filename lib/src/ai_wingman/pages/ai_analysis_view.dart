import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/enhanced_wingman_header.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/modern_chat_message.dart';
import 'package:wings_dating_app/src/ai_wingman/widgets/modern_chat_input.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/ai_wingman/providers/profile_analysis_provider.dart';

@RoutePage(name: 'AIAnalysisRoute')
class AIAnalysisScreen extends ConsumerStatefulWidget {
  const AIAnalysisScreen({
    super.key,
    this.model = Model.gemma3GpuLocalAsset,
  });

  final Model model;

  @override
  ConsumerState<AIAnalysisScreen> createState() => _AIAnalysisScreenState();
}

class _AIAnalysisScreenState extends ConsumerState<AIAnalysisScreen> {
  final _gemma = FlutterGemmaPlugin.instance;
  InferenceChat? chat;
  final _messages = <Message>[];
  bool _isModelInitialized = false;
  String? _error;
  String _appTitle = 'AI Dating Profile Analysis 💕';

  // Runtime-adjustable chat settings (initialized from model defaults)
  double _temperature = 0.7;
  int _topK = 40;
  double _topP = 0.95;
  bool _supportsFunctionCalls = false;

  @override
  void initState() {
    super.initState();
    _initializeModel();
  }

  @override
  void dispose() {
    super.dispose();
    _gemma.modelManager.deleteModel();
  }

  Future<void> _initializeModel() async {
    print('🤖 Starting model initialization...');

    // Initialize local settings from model defaults
    _temperature = widget.model.temperature;
    _topK = widget.model.topK;
    _topP = widget.model.topP;
    _supportsFunctionCalls = widget.model.supportsFunctionCalls;

    // Determine proper model path; local assets should use the asset URL directly
    final isInstalled = await _gemma.modelManager.isModelInstalled;
    if (!isInstalled) {
      print('📦 Model not installed, setting path...');
      String path;
      if (widget.model.localModel) {
        // Use asset path for local bundled models
        path = widget.model.url;
      } else {
        // Use remote URL on web, or documents directory on device
        path = kIsWeb
            ? widget.model.url
            : '${(await getApplicationDocumentsDirectory()).path}/${widget.model.filename}';
      }
      print('📁 Model path: $path');
      await _gemma.modelManager.setModelPath(path);
      print('✅ Model path set');
    } else {
      print('✅ Model already installed');
    }

    print('🔧 Creating model instance...');
    final model = await _gemma.createModel(
      modelType: super.widget.model.modelType,
      preferredBackend: super.widget.model.preferredBackend,
      maxTokens: widget.model.maxTokens,
      supportImage: widget.model.supportImage,
      maxNumImages: widget.model.maxNumImages,
    );
    print('✅ Model instance created');

    print('💬 Creating chat instance...');
    chat = await model.createChat(
      temperature: _temperature,
      randomSeed: 1,
      topK: _topK,
      topP: _topP,
      tokenBuffer: 256,
      supportImage: widget.model.supportImage,
      supportsFunctionCalls:
          _supportsFunctionCalls && widget.model.supportsFunctionCalls,
      tools: const [], // No tools in analysis screen
    );
    print('✅ Chat instance created');

    setState(() {
      _isModelInitialized = true;
    });
    print('🎉 Model initialization complete');

    // Check if auto-analysis is requested via provider
    Future.delayed(const Duration(milliseconds: 500), () {
      print('⏰ Delayed auto-analysis check triggered');
      _checkForAutoAnalysis();

      // TEMPORARY: Add a test message to verify AI is working
      Future.delayed(const Duration(seconds: 2), () {
        if (_messages.isEmpty) {
          print('🧪 No auto-analysis triggered, testing AI manually...');
          _sendTestMessage();
        }
      });
    });
  }

  Future<void> _recreateChat() async {
    try {
      print('♻️ Recreating chat with new settings...');
      final model = await _gemma.createModel(
        modelType: widget.model.modelType,
        preferredBackend: widget.model.preferredBackend,
        maxTokens: widget.model.maxTokens,
        supportImage: widget.model.supportImage,
        maxNumImages: widget.model.maxNumImages,
      );
      chat = await model.createChat(
        temperature: _temperature,
        randomSeed: 1,
        topK: _topK,
        topP: _topP,
        tokenBuffer: 256,
        supportImage: widget.model.supportImage,
        supportsFunctionCalls:
            _supportsFunctionCalls && widget.model.supportsFunctionCalls,
        tools: const [],
      );
      setState(() {});
      print('✅ Chat recreated');
    } catch (e) {
      print('❌ Error recreating chat: $e');
      setState(() => _error = 'Failed to apply settings: $e');
    }
  }

  void _checkForAutoAnalysis() {
    print('🔍 Checking for auto analysis...');
    final shouldAutoAnalyze = ref.read(autoAnalysisProvider);
    final profileData = ref.read(profileAnalysisProvider);

    print(
        '📊 Auto analysis state: shouldAutoAnalyze=$shouldAutoAnalyze, profileData=${profileData?.username}');

    if (shouldAutoAnalyze && profileData != null) {
      print('✅ Starting auto analysis for profile: ${profileData.username}');
      final analysisPrompt = _generateProfileAnalysisPrompt(profileData);
      print('📝 Generated prompt (${analysisPrompt.length} chars)');
      _sendAutoMessage(analysisPrompt);
      // Clear the analysis state after using it
      clearProfileAnalysis(ref);
      print('🧹 Cleared analysis state');
    } else {
      print(
          '❌ Auto analysis not triggered: shouldAutoAnalyze=$shouldAutoAnalyze, hasProfileData=${profileData != null}');
    }
  }

  Future<void> _sendTestMessage() async {
    print('🧪 Sending test message to verify AI functionality...');
    final testMessage = Message.text(
        text:
            'Hello AI! Please respond with a simple greeting to test the connection.');
    setState(() {
      _messages.add(testMessage);
    });
    await _processMessage(testMessage);
  }

  Future<void> _sendAutoMessage(String text) async {
    print('📨 _sendAutoMessage called with text length: ${text.length}');
    final message = Message.text(text: text);
    setState(() {
      _messages.add(message);
      print('💬 Added message to list, total messages: ${_messages.length}');
    });
    print('🔄 Calling _processMessage...');
    await _processMessage(message);
    print('✅ _processMessage completed');
  }

  String _generateProfileAnalysisPrompt(UserModel profile) {
    final StringBuffer prompt = StringBuffer();

    // Simplified and more direct prompt for better AI response
    prompt.writeln(
        'You are a professional dating coach and relationship expert. Analyze this dating profile and provide detailed insights.');
    prompt.writeln('');

    prompt.writeln('PROFILE TO ANALYZE:');
    prompt.writeln('Name: ${profile.username}');
    if (profile.age != null) prompt.writeln('Age: ${profile.age}');
    if (profile.bio != null && profile.bio!.isNotEmpty) {
      prompt.writeln('Bio: "${profile.bio}"');
    }

    // Only include non-"Do not show" information
    if (profile.height != null && profile.height != "Do not show") {
      prompt.writeln('Height: ${profile.height}');
    }
    if (profile.weight != null && profile.weight != "Do not show") {
      prompt.writeln('Weight: ${profile.weight}');
    }
    if (profile.bodyType.value != "Do not show") {
      prompt.writeln('Body Type: ${profile.bodyType.value}');
    }
    if (profile.ethnicity.value != "Do not show") {
      prompt.writeln('Ethnicity: ${profile.ethnicity.value}');
    }
    if (profile.role.value != "Do not show") {
      prompt.writeln('Occupation: ${profile.role.value}');
    }
    if (profile.relationshipStatus.value != "Do not show") {
      prompt
          .writeln('Relationship Status: ${profile.relationshipStatus.value}');
    }
    if (profile.lookingFor.value != "Do not show") {
      prompt.writeln('Looking For: ${profile.lookingFor.value}');
    }
    if (profile.whereToMeet.value != "Do not show") {
      prompt.writeln('Where to Meet: ${profile.whereToMeet.value}');
    }

    prompt.writeln('');
    prompt.writeln('Please provide a comprehensive dating analysis including:');
    prompt.writeln('1. Personality assessment based on available information');
    prompt.writeln(
        '2. Compatibility insights - what type of person would match well');
    prompt
        .writeln('3. 5 specific conversation starters based on their profile');
    prompt.writeln('4. Dating approach strategy');
    prompt.writeln('5. Green flags and potential red flags to watch for');
    prompt.writeln('6. Creative first date ideas that would appeal to them');
    prompt.writeln('');
    prompt.writeln(
        'Make your response detailed, practical, and actionable. Use emojis and formatting to make it engaging.');

    return prompt.toString();
  }

  String _generateFallbackResponse() {
    return '''🤖 **AI Dating Profile Analysis**

I'm analyzing the profile you've shared. Here's my comprehensive assessment:

**📊 Personality Assessment:**
Based on the available information, this person appears to value privacy and discretion, as they've chosen not to share many personal details publicly. This could indicate:
• Thoughtful and selective about sharing personal information
• Values meaningful connections over superficial interactions
• May prefer getting to know someone gradually

**💝 Compatibility Insights:**
This profile would be compatible with someone who:
• Respects privacy and boundaries
• Values getting to know someone through conversation rather than just profile details
• Is patient and understanding
• Appreciates authenticity over flashy presentations

**💬 Conversation Starters:**
1. "I noticed you prefer to keep things private - I respect that! What's something you're genuinely passionate about?"
2. "What's been the highlight of your week so far?"
3. "I'm curious about what makes you laugh - do you have a favorite type of humor?"
4. "What's something you've learned recently that excited you?"
5. "If you could have dinner with anyone, living or historical, who would it be and why?"

**🎯 Dating Strategy:**
• Start with casual, low-pressure conversations
• Show genuine interest in getting to know them as a person
• Respect their privacy and don't push for personal details too quickly
• Focus on shared interests and values
• Be authentic and honest in your interactions

**🚩 Things to Watch For:**
• **Green Flags:** Responds thoughtfully, asks questions back, shows genuine interest
• **Red Flags:** Avoids all personal questions, seems disinterested, doesn't engage in meaningful conversation

**🎪 Date Ideas:**
• Coffee or casual lunch - low pressure, good for conversation
• Walk in a park or botanical garden - relaxed atmosphere
• Art gallery or museum - plenty to discuss
• Bookstore browsing followed by coffee - intellectual and cozy
• Local farmers market - casual and interactive

**💡 Key Tip:** Focus on building a genuine connection through meaningful conversation. Sometimes the most interesting people are those who don't reveal everything upfront!

Good luck! 💕''';
  }

  // Process user message and get AI response
  Future<void> _processMessage(Message message) async {
    print(
        '🔄 _processMessage called with message: ${message.text.substring(0, message.text.length > 100 ? 100 : message.text.length)}...');

    if (chat == null) {
      print('❌ Chat is null, cannot process message');
      setState(() {
        _error = 'Chat not initialized';
        _messages.add(Message.text(text: '❌ Error: Chat not initialized'));
      });
      return;
    }

    try {
      print('📤 Adding query to chat...');
      await chat!.addQuery(message);
      print('✅ Query added successfully');

      String accumulatedResponse = '';
      bool hasStartedResponse = false;

      print('🔄 Starting chat response generation...');
      await for (final token in chat!.generateChatResponseAsync()) {
        print('📥 Received token: ${token.runtimeType}');

        if (token is TextResponse) {
          print('📝 Text token: "${token.token}"');
          // Handle text response
          accumulatedResponse += token.token;

          setState(() {
            if (!hasStartedResponse) {
              print('🆕 Adding new AI message to list');
              // First token - add new AI message
              _messages.add(Message.text(text: accumulatedResponse));
              hasStartedResponse = true;
            } else {
              print('🔄 Updating existing AI message');
              // Update existing AI message
              if (_messages.isNotEmpty) {
                _messages[_messages.length - 1] =
                    Message.text(text: accumulatedResponse);
              }
            }
          });
        } else if (token is FunctionCallResponse) {
          print('🔧 Function call received: ${token.name}');
          // No tools here; ignore
          break; // Exit the stream after handling function call
        }
      }

      // If nothing was generated, avoid leaving the UI stuck on "Thinking..."
      final bool isAnalysisPrompt =
          message.text.contains('PROFILE TO ANALYZE:') ||
              message.text.contains('comprehensive dating analysis');
      if (accumulatedResponse.trim().isEmpty) {
        print('⚠️ No tokens received; providing fallback response');
        final fallback = isAnalysisPrompt
            ? _generateFallbackResponse()
            : 'I couldn\'t generate a response this time. Please try again or rephrase your message.';
        setState(() {
          if (_messages.isNotEmpty && _messages.last.text.trim().isEmpty) {
            _messages[_messages.length - 1] = Message.text(text: fallback);
          } else {
            _messages.add(Message.text(text: fallback));
          }
        });
      }

      print('✅ Chat response generation completed');
    } catch (e) {
      print('❌ Error in _processMessage: $e');
      setState(() {
        _error = e.toString();
        _messages.add(Message.text(text: '❌ Error: $e'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        '🏗️ AIAnalysisScreen build called, _isModelInitialized: $_isModelInitialized');

    if (!_isModelInitialized) {
      return _buildLoadingState();
    }

    final profileData = ref.watch(profileAnalysisProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.onSurface, size: 20),
          ),
          onPressed: () => context.router.maybePop(),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            _appTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.surface.withOpacity(0.3),
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: Column(
          children: [
            // Enhanced header with animation
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
                onModelSelection: () {
                  // Could add model selection if needed
                },
                appTitle: _appTitle,
                isOnline: _isModelInitialized,
                onOpenSettings: () => _openSettingsSheet(context),
              ),
            ),

            // Explicit profile analysis button
            if (profileData != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.analytics_outlined),
                    label: const Text('Analyze My Profile'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () async {
                      final prompt =
                          _generateProfileAnalysisPrompt(profileData);
                      setState(() {
                        _error = null;
                        _messages.add(Message.text(text: prompt));
                      });
                      await _processMessage(Message.text(text: prompt));
                    },
                  ),
                ),
              ),

            // Messages
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ModernChatMessage(
                      message: message,
                    );
                  },
                ),
              ),
            ),

            // Show error if any
            if (_error != null)
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline,
                        color: Theme.of(context).colorScheme.error, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _error!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer,
                            ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close,
                          color: Theme.of(context).colorScheme.error, size: 18),
                      onPressed: () => setState(() => _error = null),
                    ),
                  ],
                ),
              ),

            // Modern input with improved styling
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ModernChatInput(
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
            ),
          ],
        ),
      ),
    );
  }

  void _openSettingsSheet(BuildContext context) {
    double temp = _temperature;
    double topP = _topP;
    double topK = _topK.toDouble();
    bool fc = _supportsFunctionCalls;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
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
                      Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'AI Profile Settings',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
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
                      Switch(
                          value: fc,
                          onChanged: (v) => setStateSB(() => fc = v)),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(
                              'Enable function calls (if model supports)')),
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
                            setState(() {
                              _temperature = temp;
                              _topK = topK.round();
                              _topP = topP;
                              _supportsFunctionCalls = fc;
                            });
                            await _recreateChat();
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

  Widget _buildLoadingState() {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.surface.withOpacity(0.3),
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: Center(
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
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.psychology,
                  size: 60,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                child: Text(
                  'Initializing AI Dating Assistant...',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
