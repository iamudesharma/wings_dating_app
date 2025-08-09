import 'package:flutter/material.dart';
import 'package:flutter_gemma/core/chat.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EnhancedWingmanHeader extends StatefulWidget {
  final InferenceChat? chat;
  final VoidCallback onModelSelection;
  final String appTitle;
  final bool isOnline;
  final VoidCallback? onOpenSettings; // new optional callback

  const EnhancedWingmanHeader({
    super.key,
    required this.chat,
    required this.onModelSelection,
    required this.appTitle,
    this.isOnline = true,
    this.onOpenSettings, // new
  });

  @override
  State<EnhancedWingmanHeader> createState() => _EnhancedWingmanHeaderState();
}

class _EnhancedWingmanHeaderState extends State<EnhancedWingmanHeader> with TickerProviderStateMixin {
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    _heartController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _heartAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _heartController,
      curve: Curves.easeInOut,
    ));

    _glowController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    if (widget.isOnline) {
      _heartController.repeat(reverse: true);
      _glowController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(EnhancedWingmanHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOnline != oldWidget.isOnline) {
      if (widget.isOnline) {
        _heartController.repeat(reverse: true);
        _glowController.repeat(reverse: true);
      } else {
        _heartController.stop();
        _glowController.stop();
      }
    }
  }

  @override
  void dispose() {
    _heartController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8A2387),
            Color(0xFFE94057),
            Color(0xFFF27121),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Main header row
              Row(
                children: [
                  // Enhanced AI Avatar
                  AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, child) {
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.4 + (_glowController.value * 0.3)),
                              Colors.transparent,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3 + (_glowController.value * 0.4)),
                              blurRadius: 20 + (_glowController.value * 10),
                              spreadRadius: 2 + (_glowController.value * 3),
                            ),
                          ],
                        ),
                        child: AnimatedBuilder(
                          animation: _heartAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _heartAnimation.value,
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.3),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16),

                  // Title and status section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AI Dating Wingman 💕',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),

                        // Status row
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.isOnline ? Colors.greenAccent : Colors.orange,
                                boxShadow: widget.isOnline
                                    ? [
                                        BoxShadow(
                                          color: Colors.greenAccent.withOpacity(0.6),
                                          blurRadius: 12,
                                          spreadRadius: 3,
                                        ),
                                      ]
                                    : null,
                              ),
                            )
                                .animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1500.ms, delay: 500.ms),
                            SizedBox(width: 8),
                            Text(
                              widget.isOnline ? 'Ready to help with dating' : 'Loading...',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Features status
                        if (widget.isOnline) ...[
                          SizedBox(height: 6),
                          Row(
                            children: [
                              if (widget.chat?.supportsImages == true) ...[
                                _buildFeatureBadge('📸 Photo Analysis', Colors.greenAccent),
                                SizedBox(width: 8),
                              ],
                              if (widget.chat?.supportsFunctionCalls == true) ...[
                                _buildFeatureBadge('🧠 Smart Tools', Colors.blueAccent),
                              ],
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),

                  // Action buttons
                  Row(
                    children: [
                      // Info button
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () => _showInfoDialog(context),
                          icon: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                          tooltip: 'Dating Tips',
                        ),
                      ),

                      SizedBox(width: 12),

                      // Settings button
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                          onPressed: widget.onOpenSettings ?? widget.onModelSelection,
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 20,
                          ),
                          tooltip: 'Model Settings',
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Quick stats bar
              if (widget.isOnline) ...[
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickStat('💬', 'Expert Chat'),
                      _buildVerticalDivider(),
                      _buildQuickStat('📊', 'Profile Analysis'),
                      _buildVerticalDivider(),
                      _buildQuickStat('💡', 'Smart Tips'),
                      _buildVerticalDivider(),
                      _buildQuickStat('🛡️', 'Safety First'),
                    ],
                  ),
                ).animate().fadeIn(delay: 800.ms, duration: 600.ms).slideY(begin: -0.3),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildQuickStat(String emoji, String label) {
    return Column(
      children: [
        Text(
          emoji,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.white.withOpacity(0.3),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1a1a2e),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.favorite, color: Color(0xFFE94057)),
              SizedBox(width: 12),
              Text(
                'Dating Success Tips',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTipItem('✨', 'Be authentic and genuine'),
                _buildTipItem('📸', 'Use recent, clear photos'),
                _buildTipItem('💬', 'Ask engaging questions'),
                _buildTipItem('👂', 'Listen actively'),
                _buildTipItem('🛡️', 'Trust your instincts'),
                _buildTipItem('⏰', 'Take your time'),
                _buildTipItem('🎯', 'Be clear about intentions'),
                _buildTipItem('💫', 'Stay positive'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Got it!',
                style: TextStyle(
                  color: Color(0xFFE94057),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTipItem(String emoji, String tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
