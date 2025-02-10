import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/src/model/stream_user.dart';

const String prefUserLogin = "pref_user_login";
const String prefUserPsw = "pref_user_psw";
const String prefUserName = "pref_user_name";
const String prefUserId = "pref_user_id";
const String prefUserAvatar = "pref_user_avatar";
const String prefSubscriptionToken = "pref_subscription_token";
const String prefSubscriptionId = "pref_subscription_id";
const String prefphone = "pref_phone";

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  late SharedPreferences prefs;

  SharedPrefs._internal();

  bool inited = false;

  static SharedPrefs get instance => _instance;

  Future<SharedPrefs> init() async {
    Completer<SharedPrefs> completer = Completer();
    if (inited) {
      completer.complete(_instance);
    } else {
      prefs = await SharedPreferences.getInstance();
      inited = true;
      completer.complete(_instance);
    }
    return completer.future;
  }

  saveNewUser(StreamUser cubeUser) async {
    prefs.clear();
    prefs.setString(prefUserLogin, cubeUser.toJson());
  }

  // updateUser(CubeUser cubeUser) {
  //   if (cubeUser.password != null) {
  //     prefs.setString(prefUserPsw, cubeUser.password!);
  //   }
  //   if (cubeUser.login != null) prefs.setString(prefUserLogin, cubeUser.login!);
  //   if (cubeUser.fullName != null) {
  //     prefs.setString(prefUserName, cubeUser.fullName!);
  //   }
  //   if (cubeUser.phone != null) {
  //     prefs.setString(prefphone, cubeUser.phone!);
  //   }
  //   if (cubeUser.avatar != null) {
  //     prefs.setString(prefUserAvatar, cubeUser.avatar!);
  //   }
  // }

  StreamUser? getUser() {
    if (prefs.get(prefUserLogin) == null) return null;

    StreamUser user = StreamUser().copyWith();
    return user;
  }

  deleteUser() {
    prefs.clear();
  }

  saveSubscriptionToken(String token) {
    prefs.setString(prefSubscriptionToken, token);
  }

  String getSubscriptionToken() {
    return prefs.getString(prefSubscriptionToken) ?? "";
  }

  saveSubscriptionId(int id) {
    prefs.setInt(prefSubscriptionId, id);
  }

  int getSubscriptionId() {
    return prefs.getInt(prefSubscriptionId) ?? 0;
  }
}
