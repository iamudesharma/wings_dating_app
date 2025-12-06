import 'package:flutter/material.dart';

class WingsAnimatedLogo extends StatefulWidget {
  final double size;
  final bool animate;

  const WingsAnimatedLogo({super.key, this.size = 150.0, this.animate = true});

  @override
  State<WingsAnimatedLogo> createState() => _WingsAnimatedLogoState();
}

class _WingsAnimatedLogoState extends State<WingsAnimatedLogo> with TickerProviderStateMixin {
  late AnimationController _wingController;
  late AnimationController _heartController;
  late AnimationController _shimmerController;

  late Animation<double> _leftWingAnimation;
  late Animation<double> _rightWingAnimation;
  late Animation<double> _heartScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Wing Animation (Open/Close)
    _wingController = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _leftWingAnimation = Tween<double>(
      begin: 0.0,
      end: -0.15,
    ).animate(CurvedAnimation(parent: _wingController, curve: Curves.easeInOut));

    _rightWingAnimation = Tween<double>(
      begin: 0.0,
      end: 0.15,
    ).animate(CurvedAnimation(parent: _wingController, curve: Curves.easeInOut));

    // Heart Bounce Animation
    _heartController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    _heartScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _heartController, curve: Curves.elasticOut));

    // Shimmer Animation
    _shimmerController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    if (widget.animate) {
      _startAnimations();
    }
  }

  void _startAnimations() {
    _wingController.repeat(reverse: true);
    _heartController.repeat(reverse: true);
    _shimmerController.repeat();
  }

  @override
  void didUpdateWidget(WingsAnimatedLogo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _startAnimations();
      } else {
        _wingController.stop();
        _heartController.stop();
        _shimmerController.stop();
      }
    }
  }

  @override
  void dispose() {
    _wingController.dispose();
    _heartController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size * 0.9,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              // Left Wing
              Positioned(
                left: 0,
                right: widget.size * 0.5, // Constrain to left half
                top: widget.size * 0.2,
                child: Align(
                  alignment: Alignment.centerRight, // Align to the center spine
                  child: AnimatedBuilder(
                    animation: _leftWingAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _leftWingAnimation.value,
                        alignment: Alignment.centerRight,
                        child: child,
                      );
                    },
                    child: CustomPaint(
                      size: Size(widget.size * 0.45, widget.size * 0.5),
                      painter: AngelWingPainter(isLeft: true),
                    ),
                  ),
                ),
              ),

              // Right Wing
              Positioned(
                left: widget.size * 0.5, // Constrain to right half
                right: 0,
                top: widget.size * 0.2,
                child: Align(
                  alignment: Alignment.centerLeft, // Align to the center spine
                  child: AnimatedBuilder(
                    animation: _rightWingAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rightWingAnimation.value,
                        alignment: Alignment.centerLeft,
                        child: child,
                      );
                    },
                    child: CustomPaint(
                      size: Size(widget.size * 0.45, widget.size * 0.5),
                      painter: AngelWingPainter(isLeft: false),
                    ),
                  ),
                ),
              ),

              // Rainbow Circle (Filled)
              Positioned(
                top: widget.size * 0.2,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: widget.size * 0.4,
                    height: widget.size * 0.4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Filled circle
                      gradient: const SweepGradient(
                        colors: [
                          Color(0xFFFF0055),
                          Color(0xFFFF9900),
                          Color(0xFFFFDD00),
                          Color(0xFF00EE55),
                          Color(0xFF0099FF),
                          Color(0xFFAA00FF),
                          Color(0xFFFF0055),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0), // Border width
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // Inner fill
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Small Heart on Top
              Positioned(
                top: widget.size * 0.1, // Positioned at the top of the circle
                left: 0,
                right: 0,
                child: Center(
                  child: ScaleTransition(
                    scale: _heartScaleAnimation,
                    child: Icon(
                      Icons.favorite,
                      color: const Color(0xFFFF0055),
                      size: widget.size * 0.25, // Smaller size (25% of container)
                      shadows: [
                        BoxShadow(color: const Color(0xFFFF0055).withOpacity(0.6), blurRadius: 10, spreadRadius: 2),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bottom Shimmer Logo
        const SizedBox(height: 5),
        AnimatedBuilder(
          animation: _shimmerController,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: const [Colors.white, Colors.white, Color(0xFFE94560), Colors.white, Colors.white],
                  stops: [
                    0.0,
                    _shimmerController.value - 0.2,
                    _shimmerController.value,
                    _shimmerController.value + 0.2,
                    1.0,
                  ],
                  tileMode: TileMode.clamp,
                ).createShader(bounds);
              },
              child: const Text(
                'WINGS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 4, color: Colors.white),
              ),
            );
          },
        ),
      ],
    );
  }
}

class AngelWingPainter extends CustomPainter {
  final bool isLeft;

  AngelWingPainter({required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white.withOpacity(0.95), Colors.white.withOpacity(0.7)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isLeft) {
      // Draw Left Angel Wing (Feathered)
      path.moveTo(size.width, size.height * 0.4); // Pivot point

      // Top curve
      path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.1, size.height * 0.2);

      // Feathers
      path.quadraticBezierTo(0, size.height * 0.3, size.width * 0.2, size.height * 0.4);
      path.quadraticBezierTo(size.width * 0.05, size.height * 0.5, size.width * 0.25, size.height * 0.6);
      path.quadraticBezierTo(size.width * 0.1, size.height * 0.7, size.width * 0.3, size.height * 0.8);
      path.quadraticBezierTo(size.width * 0.2, size.height * 0.9, size.width * 0.5, size.height * 0.85);

      // Bottom return
      path.quadraticBezierTo(size.width * 0.8, size.height * 0.8, size.width, size.height * 0.6);
    } else {
      // Draw Right Angel Wing (Mirrored)
      path.moveTo(0, size.height * 0.4); // Pivot point

      // Top curve
      path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.9, size.height * 0.2);

      // Feathers
      path.quadraticBezierTo(size.width, size.height * 0.3, size.width * 0.8, size.height * 0.4);
      path.quadraticBezierTo(size.width * 0.95, size.height * 0.5, size.width * 0.75, size.height * 0.6);
      path.quadraticBezierTo(size.width * 0.9, size.height * 0.7, size.width * 0.7, size.height * 0.8);
      path.quadraticBezierTo(size.width * 0.8, size.height * 0.9, size.width * 0.5, size.height * 0.85);

      // Bottom return
      path.quadraticBezierTo(size.width * 0.2, size.height * 0.8, 0, size.height * 0.6);
    }

    path.close();
    canvas.drawPath(path, paint);

    // Add feather details
    final detailPaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, detailPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
