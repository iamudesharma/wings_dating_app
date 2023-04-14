import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:connectycube_sdk/connectycube_sdk.dart';

import '../const/pref_util.dart';

class LoginView extends StatelessWidget {
  static const String TAG = "LoginScreen";

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: const Text('Chat')),
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
                child: const CircularProgressIndicator(
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
    if (_isLoginContinues) return const SizedBox.shrink();
    SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
    CubeUser? user = sharedPrefs.getUser();
    if (user != null) {
      _loginToCC(context, user);
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_buildTextFields(), _buildButtons()],
      );
    }
  }

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
              onPressed: _loginPressed,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _formChange,
              child: const Text('Don\'t have an account? Tap here to register.'),
            ),
            TextButton(
              onPressed: _deleteUserPressed,
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
              onPressed: _createAccountPressed,
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

  void _loginPressed() {
    print('login with $_login and $_password');
    _loginToCC(context, CubeUser(login: _login, password: _password),
        saveUser: true);
  }

  void _createAccountPressed() {
    print('create an user with $_login and $_password');
    _signInCC(context,
        CubeUser(login: _login, password: _password, fullName: _login));
  }

  void _deleteUserPressed() {
    print('_deleteUserPressed $_login and $_password');
    _userDelete();
  }

  void _userDelete() {
    createSession(CubeUser(login: _login, password: _password))
        .then((cubeSession) {
      deleteUser(cubeSession.userId!).then((_) {
        print("signOut success");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Delete user"),
                content: const Text("succeeded"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
            });
      });
    }).catchError((exception) {
      _processLoginError(exception);
    });
  }

  _signInCC(BuildContext context, CubeUser user) async {
    if (_isLoginContinues) return;

    setState(() {
      _isLoginContinues = true;
    });
    if (!CubeSessionManager.instance.isActiveSessionValid()) {
      try {
        await createSession();
      } catch (error) {
        _processLoginError(error);
      }
    }
    signUp(user).then((newUser) {
      print("signUp newUser $newUser");
      user.id = newUser.id;
      SharedPrefs.instance.saveNewUser(user);
      signIn(user).then((result) {
        _loginToCubeChat(context, user);
      });
    }).catchError((exception) {
      _processLoginError(exception);
    });
  }

  _loginToCC(BuildContext context, CubeUser user, {bool saveUser = false}) {
    print("_loginToCC user: $user");
    if (_isLoginContinues) return;
    setState(() {
      _isLoginContinues = true;
    });

    createSession(user).then((cubeSession) async {
      print("createSession cubeSession: $cubeSession");
      var tempUser = user;
      user = cubeSession.user!..password = tempUser.password;
      if (saveUser) {
        SharedPrefs.instance.init().then((sharedPrefs) {
          sharedPrefs.saveNewUser(user);
        });
      }

      // PushNotificationsManager.instance.init();

      _loginToCubeChat(context, user);
    }).catchError((error) {
      _processLoginError(error);
    });
  }

  _loginToCubeChat(BuildContext context, CubeUser user) {
    print("_loginToCubeChat user $user");
    CubeChatConnectionSettings.instance.totalReconnections = 0;
    CubeChatConnection.instance.login(user).then((cubeUser) {
      _isLoginContinues = false;
      _goDialogScreen(context, cubeUser);
    }).catchError((error) {
      _processLoginError(error);
    });
  }

  void _processLoginError(exception) {
    log("Login error $exception", TAG);
    setState(() {
      _isLoginContinues = false;
    });
  }

  void _goDialogScreen(BuildContext context, CubeUser cubeUser) async {
    log("_goDialogScreen");

    // TODO replace with code below after fix https://github.com/FirebaseExtended/flutterfire/issues/4898
    // FirebaseMessaging.instance.getInitialMessage().then((remoteMessage) {
    //   log("getInitialMessage, remoteMessage: $remoteMessage");
    //
    //   if (remoteMessage == null || remoteMessage.data == null) {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       'select_dialog',
    //       arguments: {USER_ARG_NAME: cubeUser},
    //     );
    //   } else {
    //     Map<String, dynamic> payloadObject = remoteMessage.data;
    //     String dialogId = payloadObject['dialog_id'];
    //
    //     log("getNotificationAppLaunchDetails, dialog_id: $dialogId");
    //
    //     getDialogs({'id': dialogId}).then((dialogs) {
    //       if (dialogs?.items != null && dialogs.items.isNotEmpty ?? false) {
    //         CubeDialog dialog = dialogs.items.first;
    //         Navigator.pushReplacementNamed(context, 'chat_dialog',
    //             arguments: {USER_ARG_NAME: cubeUser, DIALOG_ARG_NAME: dialog});
    //       }
    //     });
    //   }
    // }).catchError((onError) {
    //   log("getNotificationAppLaunchDetails, error: $onError");
    //   Navigator.pushReplacementNamed(
    //     context,
    //     'select_dialog',
    //     arguments: {USER_ARG_NAME: cubeUser},
    //   );
    // });

    FlutterLocalNotificationsPlugin()
        .getNotificationAppLaunchDetails()
        .then((details) {
      String? payload = details!.payload;

      if (payload == null) {
        // Navigator.pushReplacementNamed(
        //   context,
        //   'select_dialog',
        //   arguments: {USER_ARG_NAME: cubeUser},
        // );
      } else {
        Map<String, dynamic> payloadObject = jsonDecode(payload);
        String? dialogId = payloadObject['dialog_id'];

        getDialogs({'id': dialogId}).then((dialogs) {
          if (dialogs?.items != null && dialogs!.items.isNotEmpty) {
            CubeDialog dialog = dialogs.items.first;
            //   Navigator.pushReplacementNamed(context, 'chat_dialog',
            //       arguments: {USER_ARG_NAME: cubeUser, DIALOG_ARG_NAME: dialog});
          }
        });
      }
    }).catchError((onError) {
      // Navigator.pushReplacementNamed(
      //   context,
      //   'select_dialog',
      //   arguments: {USER_ARG_NAME: cubeUser},
      // );
    });
  }
}
