import 'package:flutter/material.dart';

class DatingSuggestionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DatingSuggestionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.8),
                  color.withOpacity(0.6),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.7),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DatingSuggestionsWidget extends StatelessWidget {
  final Function(String) onSuggestionTap;

  const DatingSuggestionsWidget({
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
          Padding(
            padding: EdgeInsets.only(left: 8, bottom: 12),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.pink,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Dating Suggestions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DatingSuggestionCard(
                  title: 'Profile Help',
                  description: 'Get tips to improve your dating profile',
                  icon: Icons.person_outline,
                  color: Colors.purple,
                  onTap: () => onSuggestionTap(
                      'Help me improve my dating profile. What are some tips for great photos and bio?'),
                ),
                DatingSuggestionCard(
                  title: 'Conversation Starters',
                  description: 'Creative first message ideas',
                  icon: Icons.chat_bubble_outline,
                  color: Colors.blue,
                  onTap: () =>
                      onSuggestionTap('Give me some creative conversation starters for dating apps that work well'),
                ),
                DatingSuggestionCard(
                  title: 'Date Ideas',
                  description: 'Fun and unique date suggestions',
                  icon: Icons.favorite_outline,
                  color: Colors.pink,
                  onTap: () =>
                      onSuggestionTap('Suggest some creative and fun date ideas for different budgets and interests'),
                ),
                DatingSuggestionCard(
                  title: 'Red Flags',
                  description: 'Warning signs to watch for',
                  icon: Icons.warning_outlined,
                  color: Colors.red,
                  onTap: () => onSuggestionTap('What are some common red flags to watch out for when dating?'),
                ),
                DatingSuggestionCard(
                  title: 'Confidence Boost',
                  description: 'Tips to feel more confident',
                  icon: Icons.psychology_outlined,
                  color: Colors.orange,
                  onTap: () => onSuggestionTap('How can I build confidence when dating and meeting new people?'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
