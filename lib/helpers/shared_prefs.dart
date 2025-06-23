import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

class SharedPrefs {
  static const String userKey = 'current_user';
  static const String userListKey = 'user_list';
  SharedPrefs._();
  static final SharedPrefs instance = SharedPrefs._();

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(userKey);
    if (userJson == null) return null;
    try {
      final map = jsonDecode(userJson) as Map<String, dynamic>;
      return UserModel.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }

  Future<void> saveUserList(List<UserModel?> users) async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = jsonEncode(users.map((u) => u?.toJson()).toList());
    await prefs.setString(userListKey, userListJson);
  }

  Future<List<UserModel?>> getUserList() async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = prefs.getString(userListKey);
    if (userListJson == null) return [];
    try {
      final list = jsonDecode(userListJson) as List<dynamic>;
      return list.map((e) => e != null ? UserModel.fromJson(e as Map<String, dynamic>) : null).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> clearUserList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userListKey);
  }
}
