import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EnhancedDatingSuggestionCard extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback onTap;
  final List<String> tags;

  const EnhancedDatingSuggestionCard({
    super.key,
    required this.title,
    required this.description,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.onTap,
    this.tags = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        shadowColor: gradient.colors.first.withOpacity(0.3),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: gradient,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with icon and title
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 16),

                  // Tags
                  if (tags.isNotEmpty) ...[
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: tags
                          .take(3)
                          .map((tag) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 12),
                  ],

                  // Action indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tap to explore',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.7),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EnhancedDatingSuggestionsWidget extends StatelessWidget {
  final Function(String) onSuggestionTap;

  const EnhancedDatingSuggestionsWidget({
    super.key,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Enhanced header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE94057).withOpacity(0.1),
                  Color(0xFFF27121).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFFE94057).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFE94057), Color(0xFFF27121)],
                    ),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dating Assistance Hub',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Expert advice & personalized guidance for your dating journey',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),

          SizedBox(height: 20),

          // Suggestions list
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                EnhancedDatingSuggestionCard(
                  title: 'Profile Optimization',
                  subtitle: 'Professional Analysis',
                  description:
                      'Get expert feedback on your dating profile photos, bio, and overall presentation. Increase your match rate with data-driven insights.',
                  icon: Icons.person_search,
                  gradient: LinearGradient(
                    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  ),
                  tags: ['Photos', 'Bio', 'Analytics'],
                  onTap: () => onSuggestionTap(
                    'I need comprehensive help optimizing my dating profile. Please analyze what makes profiles successful and give me specific tips for photos, bio writing, and overall presentation that will increase my match rate.',
                  ),
                ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(begin: -0.3),
                EnhancedDatingSuggestionCard(
                  title: 'Conversation Mastery',
                  subtitle: 'Message Like a Pro',
                  description:
                      'Learn the art of engaging conversations. From perfect openers to keeping discussions flowing naturally and meaningfully.',
                  icon: Icons.chat_bubble_outline,
                  gradient: LinearGradient(
                    colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
                  ),
                  tags: ['Openers', 'Flow', 'Engagement'],
                  onTap: () => onSuggestionTap(
                    'Teach me how to master dating conversations. I want to learn creative opening messages, how to keep conversations interesting, ask engaging questions, and transition from chat to dates smoothly.',
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(begin: -0.3),
                EnhancedDatingSuggestionCard(
                  title: 'Date Planning Expert',
                  subtitle: 'Memorable Experiences',
                  description:
                      'Discover creative, budget-friendly date ideas that create lasting impressions and deeper connections.',
                  icon: Icons.calendar_today,
                  gradient: LinearGradient(
                    colors: [Color(0xFFfa709a), Color(0xFFfee140)],
                  ),
                  tags: ['Creative', 'Budget-wise', 'Memorable'],
                  onTap: () => onSuggestionTap(
                    'Help me plan amazing dates! I want creative, unique date ideas for different budgets, seasons, and relationship stages. Include first date suggestions, romantic ideas, and fun activities that build connection.',
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 600.ms).slideX(begin: -0.3),
                EnhancedDatingSuggestionCard(
                  title: 'Red Flag Detection',
                  subtitle: 'Stay Safe & Smart',
                  description:
                      'Learn to identify warning signs early. Protect yourself from toxic behaviors and unhealthy relationship patterns.',
                  icon: Icons.security,
                  gradient: LinearGradient(
                    colors: [Color(0xFFff6b6b), Color(0xFFffa500)],
                  ),
                  tags: ['Safety', 'Awareness', 'Protection'],
                  onTap: () => onSuggestionTap(
                    'Teach me about red flags in dating. I want to learn how to identify manipulative behavior, toxic patterns, love bombing, and other warning signs. Help me understand healthy vs unhealthy relationship dynamics.',
                  ),
                ).animate().fadeIn(delay: 800.ms, duration: 600.ms).slideX(begin: -0.3),
                EnhancedDatingSuggestionCard(
                  title: 'Confidence Building',
                  subtitle: 'Inner Strength',
                  description:
                      'Develop unshakeable self-confidence. Overcome dating anxiety and present your authentic, attractive self.',
                  icon: Icons.psychology,
                  gradient: LinearGradient(
                    colors: [Color(0xFF6a11cb), Color(0xFF2575fc)],
                  ),
                  tags: ['Mindset', 'Authenticity', 'Growth'],
                  onTap: () => onSuggestionTap(
                    'Help me build genuine confidence for dating. I want to overcome anxiety, develop self-worth, improve body language, and learn how to be authentically attractive while staying true to myself.',
                  ),
                ).animate().fadeIn(delay: 1000.ms, duration: 600.ms).slideX(begin: -0.3),
                EnhancedDatingSuggestionCard(
                  title: 'Relationship Stages',
                  subtitle: 'Navigate Every Phase',
                  description:
                      'Understanding relationship progression from matching to commitment. Get guidance for each stage of your dating journey.',
                  icon: Icons.trending_up,
                  gradient: LinearGradient(
                    colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
                  ),
                  tags: ['Stages', 'Progression', 'Commitment'],
                  onTap: () => onSuggestionTap(
                    'Guide me through different relationship stages. Help me understand how to progress from matching to first date, casual dating to exclusive, and building toward a committed relationship. What are the key milestones and how to navigate them?',
                  ),
                ).animate().fadeIn(delay: 1200.ms, duration: 600.ms).slideX(begin: -0.3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
