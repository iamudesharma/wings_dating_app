import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  const ResponsiveLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: child,
      ),
    );
  }
}

Future<bool> isUserFavorite(String id) async {
  try {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) return false;

    final httpTemplate = HttpTemplate();
    final response = await httpTemplate.get("/users/$currentUserId");

    if (response.containsKey('data') &&
        response['data'] is Map<String, dynamic>) {
      final userData = UserModel.fromJson(response['data']);
      return userData.favoriteList.contains(id);
    }
    return false;
  } catch (e) {
    print("Error checking favorite status: $e");
    return false;
  }
}
