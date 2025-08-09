import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(automaticallyImplyLeading: false, title: const Text('Chat')),
      body: const LoginPage(),
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
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  bool _isLoginContinues = false;

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[_buildLogoField(), _initLoginWidgets()],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoField() {
//    return Image.asset('assets/images/splash.png');
    return Container(
      child: Align(
        alignment: FractionalOffset.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset('assets/images/splash.png'),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 18,
              width: 18,
              child: Visibility(
                visible: _isLoginContinues,
                child: const CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                ),
              ),
            ),
          ],
        ),
      ),
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
        });
  }

  Future<Widget> getFilterChipsWidgets() async {
    // if (_isLoginContinues) return const SizedBox.shrink();
    // SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
    // CubeUser? user = sharedPrefs.getUser();
    // if (user != null) {
    //   _loginToCC(context, user);
    //   return const SizedBox.shrink();
    // } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[_buildTextFields(), _buildButtons()],
    );
  }
  // }

  Widget _buildTextFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _loginFilter,
          decoration: const InputDecoration(labelText: 'Login'),
        ),
        TextField(
          controller: _passwordFilter,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        )
      ],
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _formChange,
              child:
                  const Text('Don\'t have an account? Tap here to register.'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Delete user?'),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create an Account'),
            ),
            TextButton(
              onPressed: _formChange,
              child: const Text('Have an account? Click here to login.'),
            )
          ],
        ),
      );
    }
  }
}
