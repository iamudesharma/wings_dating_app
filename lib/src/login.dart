import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wings_dating_app/src/widgets/wings_animated_logo.dart';
import 'dart:ui';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1A2E), // Dark Blue
                  Color(0xFF16213E), // Darker Blue
                  Color(0xFF0F3460), // Navy
                ],
              ),
            ),
          ),

          // Animated Background Shapes
          Positioned(
            top: -100,
            left: -100,
            child:
                Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFE94560).withOpacity(0.3),
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .scale(duration: 3.seconds, begin: const Offset(1, 1), end: const Offset(1.2, 1.2)),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child:
                Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF533483).withOpacity(0.3),
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .scale(duration: 4.seconds, begin: const Offset(1, 1), end: const Offset(1.3, 1.3)),
          ),

          // Main Content
          const LoginPage(),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class LoginPageState extends State<LoginPage> {
  static const String TAG = "_LoginPageState";
  final TextEditingController _loginFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _login = "";
  String _password = "";
  FormType _form = FormType.login;

  final bool _isLoginContinues = false;

  LoginPageState() {
    _loginFilter.addListener(_loginListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _loginListen() {
    if (_loginFilter.text.isEmpty) {
      _login = "";
    } else {
      _login = _loginFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, spreadRadius: 5)],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[_buildLogoField(), const SizedBox(height: 30), _initLoginWidgets()],
                ),
              ),
            ),
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
      ),
    );
  }

  Widget _buildLogoField() {
    return Column(
      children: [
        const WingsAnimatedLogo(size: 120),
        const SizedBox(height: 20),
        Text(
          'Wings Dating',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            shadows: [Shadow(color: Colors.black.withOpacity(0.3), offset: const Offset(2, 2), blurRadius: 4)],
          ),
        ).animate().fadeIn(delay: 300.ms).scale(),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 18,
          width: 18,
          child: Visibility(
            visible: _isLoginContinues,
            child: const CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  _initLoginWidgets() {
    return FutureBuilder<Widget>(
      future: getFilterChipsWidgets(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        return const SizedBox.shrink();
      },
    );
  }

  Future<Widget> getFilterChipsWidgets() async {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[_buildTextFields(), const SizedBox(height: 20), _buildButtons()],
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: <Widget>[
        _buildStyledTextField(controller: _loginFilter, label: 'Login', icon: Icons.person_outline),
        const SizedBox(height: 16),
        _buildStyledTextField(
          controller: _passwordFilter,
          label: 'Password',
          icon: Icons.lock_outline,
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE94560)),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildPrimaryButton(onPressed: () {}, text: 'Login'),
          const SizedBox(height: 10),
          _buildTextButton(onPressed: _formChange, text: 'Don\'t have an account? Register.'),
          _buildTextButton(onPressed: () {}, text: 'Delete user?', color: Colors.redAccent.withOpacity(0.8)),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildPrimaryButton(onPressed: () {}, text: 'Create an Account'),
          const SizedBox(height: 10),
          _buildTextButton(onPressed: _formChange, text: 'Have an account? Login.'),
        ],
      );
    }
  }

  Widget _buildPrimaryButton({required VoidCallback onPressed, required String text}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFE94560), Color(0xFF533483)]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: const Color(0xFFE94560).withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTextButton({required VoidCallback onPressed, required String text, Color? color}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color ?? Colors.white.withOpacity(0.8))),
    );
  }
}
