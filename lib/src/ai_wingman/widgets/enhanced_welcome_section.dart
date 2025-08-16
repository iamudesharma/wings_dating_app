import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EnhancedWelcomeSection extends StatelessWidget {
  const EnhancedWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Main welcome card
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF667eea).withOpacity(0.15),
                  Color(0xFF764ba2).withOpacity(0.15),
                  Color(0xFFE94057).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Color(0xFF667eea).withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF667eea).withOpacity(0.2),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                // Avatar and title section
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF667eea).withOpacity(0.4),
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to AI Dating Wingman! 💕',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your AI-powered dating coach',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Description
                Text(
                  'I\'m here to help you navigate the dating world with confidence and success! Whether you\'re new to dating or looking to improve your game, I provide personalized advice, expert tips, and real-time guidance.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.3),

          SizedBox(height: 24),

          // Feature highlights
          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  icon: Icons.psychology,
                  title: 'Expert Advice',
                  description: 'Psychology-backed dating strategies',
                  gradient: LinearGradient(
                    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildFeatureCard(
                  icon: Icons.image_search,
                  title: 'Photo Analysis',
                  description: 'AI-powered profile optimization',
                  gradient: LinearGradient(
                    colors: [Color(0xFFE94057), Color(0xFFF27121)],
                  ),
                ),
              ),
            ],
          )
              .animate()
              .fadeIn(delay: 400.ms, duration: 600.ms)
              .slideY(begin: 0.3),

          SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  icon: Icons.security,
                  title: 'Safety First',
                  description: 'Red flag detection & safety tips',
                  gradient: LinearGradient(
                    colors: [Color(0xFFfa709a), Color(0xFFfee140)],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildFeatureCard(
                  icon: Icons.chat_bubble_outline,
                  title: 'Conversation',
                  description: 'Master the art of messaging',
                  gradient: LinearGradient(
                    colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                  ),
                ),
              ),
            ],
          )
              .animate()
              .fadeIn(delay: 600.ms, duration: 600.ms)
              .slideY(begin: 0.3),

          SizedBox(height: 24),

          // Quick stats
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('10M+', 'Success Stories'),
                _buildVerticalDivider(),
                _buildStatItem('95%', 'Satisfaction Rate'),
                _buildVerticalDivider(),
                _buildStatItem('24/7', 'Available'),
              ],
            ),
          )
              .animate()
              .fadeIn(delay: 800.ms, duration: 600.ms)
              .scale(begin: Offset(0.8, 0.8)),

          SizedBox(height: 20),

          // CTA
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE94057), Color(0xFFF27121)],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE94057).withOpacity(0.3),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Text(
              'Start your dating journey below! 👇',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          )
              .animate()
              .fadeIn(delay: 1000.ms, duration: 600.ms)
              .shimmer(duration: 2000.ms),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required LinearGradient gradient,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient.colors.map((c) => c.withOpacity(0.1)).toList(),
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: gradient.colors.first.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: gradient,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.2),
    );
  }
}
