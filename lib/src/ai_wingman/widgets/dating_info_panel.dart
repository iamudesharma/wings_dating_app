import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DatingInfoPanel extends StatelessWidget {
  const DatingInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Dating Insights & Tips',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // Quick tips carousel
          SizedBox(
            height: 150, // was 140 to prevent minor overflows
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildQuickTipCard(
                  title: 'Profile Photos',
                  tip:
                      'Use recent photos that show your personality. Smile genuinely and include variety.',
                  icon: Icons.camera_alt,
                  color: Color(0xFF667eea),
                ),
                _buildQuickTipCard(
                  title: 'First Messages',
                  tip:
                      'Reference something from their profile. Ask engaging questions, avoid generic "hey".',
                  icon: Icons.message,
                  color: Color(0xFFE94057),
                ),
                _buildQuickTipCard(
                  title: 'Bio Writing',
                  tip:
                      'Be authentic, show interests, add humor. Keep it concise but memorable.',
                  icon: Icons.edit,
                  color: Color(0xFF4facfe),
                ),
                _buildQuickTipCard(
                  title: 'Safety First',
                  tip:
                      'Meet in public places, trust your instincts, and tell someone your plans.',
                  icon: Icons.security,
                  color: Color(0xFFfa709a),
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // Dating statistics
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF667eea).withOpacity(0.1),
                  Color(0xFF764ba2).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(0xFF667eea).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.trending_up,
                        color: Colors.greenAccent, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Dating Success Stats',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Stats grid
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard('73%',
                          'People prefer authentic profiles over perfect ones'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard('85%',
                          'First dates successful when both feel comfortable'),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                          '92%', 'Relationships start with good conversation'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                          '67%', 'People value emotional intelligence'),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

          SizedBox(height: 24),

          // Do's and Don'ts
          Row(
            children: [
              Expanded(
                child: _buildDoDontCard(
                  title: 'DO ✅',
                  items: [
                    'Be yourself authentically',
                    'Ask thoughtful questions',
                    'Listen actively',
                    'Respect boundaries',
                    'Communicate clearly',
                  ],
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildDoDontCard(
                  title: 'DON\'T ❌',
                  items: [
                    'Use outdated photos',
                    'Be too pushy',
                    'Ignore red flags',
                    'Talk only about yourself',
                    'Rush the process',
                  ],
                  color: Colors.red,
                ),
              ),
            ],
          )
              .animate()
              .fadeIn(delay: 600.ms, duration: 600.ms)
              .slideY(begin: 0.3),
        ],
      ),
    );
  }

  Widget _buildQuickTipCard({
    required String title,
    required String tip,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12), // was 16
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(6), // was 8
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.2),
                ),
                child: Icon(icon, color: color, size: 14), // was 16
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 13, // was 14
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // was 12
          Text(
            tip,
            style: TextStyle(
              fontSize: 11, // was 12
              color: Colors.white.withOpacity(0.8),
              height: 1.3,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3);
  }

  Widget _buildStatCard(String percentage, String description) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            percentage,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildDoDontCard({
    required String title,
    required List<String> items,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 12),
          ...items
              .map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          margin: EdgeInsets.only(top: 6, right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withOpacity(0.7),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.8),
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class DatingFactsCarousel extends StatefulWidget {
  const DatingFactsCarousel({super.key});

  @override
  State<DatingFactsCarousel> createState() => _DatingFactsCarouselState();
}

class _DatingFactsCarouselState extends State<DatingFactsCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<DatingFact> _facts = [
    DatingFact(
      title: 'The 7-Second Rule',
      description:
          'People decide if they\'re attracted to someone within the first 7 seconds of meeting.',
      icon: Icons.timer,
      color: Color(0xFFE94057),
    ),
    DatingFact(
      title: 'Similarity Attraction',
      description:
          'People are more attracted to others who share similar interests and values.',
      icon: Icons.favorite,
      color: Color(0xFF667eea),
    ),
    DatingFact(
      title: 'Mirror Neurons',
      description:
          'Mirroring someone\'s body language can increase attraction and rapport.',
      icon: Icons.psychology,
      color: Color(0xFF4facfe),
    ),
    DatingFact(
      title: 'The Halo Effect',
      description:
          'One positive trait can influence perception of other qualities.',
      icon: Icons.star,
      color: Color(0xFFfa709a),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Psychology of Dating',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // Increased height to avoid overflow and adjusted inner paddings/sizes
          SizedBox(
            height: 190, // increased from 160 to avoid overflows
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _facts.length,
              itemBuilder: (context, index) {
                final fact = _facts[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.all(16), // reduced from 20
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        fact.color.withOpacity(0.2),
                        fact.color.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: fact.color.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.max, // ensure proper flex behavior
                    children: [
                      Container(
                        padding: EdgeInsets.all(12), // reduced from 16
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: fact.color.withOpacity(0.2),
                        ),
                        child: Icon(
                          fact.icon,
                          color: fact.color,
                          size: 28, // reduced from 32
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        fact.title,
                        style: TextStyle(
                          fontSize: 15, // was 16
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6),
                      Flexible(
                        child: Text(
                          fact.description,
                          style: TextStyle(
                            fontSize: 12, // was 13
                            color: Colors.white.withOpacity(0.8),
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16),

          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _facts.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class DatingFact {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  DatingFact({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
