import 'package:flutter/material.dart';
import 'package:wings_dating_app/const/pref_util.dart';

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

bool isUserFavorite(String id) {
  final data = SharedPrefs.instance.getUsers();

  if (data != null) {
    return data.favoriteList.contains(id);
  }
  return false;
}
