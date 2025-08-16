import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

class SharedPrefs {
  static const String userKey = 'current_user';
  static const String userListKey = 'user_list';
  SharedPrefs._();
  static final SharedPrefs instance = SharedPrefs._();

  Future<void> saveUser(UserModel user) async {
    // Validate user data before saving
    if (user.id.isEmpty) {
      print("SharedPrefs: Cannot save user with empty ID");
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
    print("SharedPrefs: Successfully saved user ${user.username} (${user.id})");
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(userKey);
    if (userJson == null) {
      print("SharedPrefs: No user data found in storage");
      return null;
    }

    if (userJson.isEmpty) {
      print("SharedPrefs: User data is empty string");
      return null;
    }

    try {
      final map = jsonDecode(userJson) as Map<String, dynamic>;
      final user = UserModel.fromJson(map);

      // Validate essential fields
      if (user.id.isEmpty) {
        print("SharedPrefs: User data is missing required ID field");
        await clearUser(); // Clear invalid data
        return null;
      }

      print(
          "SharedPrefs: Successfully loaded user ${user.username} (${user.id})");
      return user;
    } catch (e) {
      print("SharedPrefs: Error parsing user data: $e");
      await clearUser(); // Clear corrupted data
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
      return list
          .map((e) =>
              e != null ? UserModel.fromJson(e as Map<String, dynamic>) : null)
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> clearUserList() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userListKey);
  }
}
