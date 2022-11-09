import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/src/auth/sign_options.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: BookListPage, initial: true),
    AutoRoute(page: SignOptionsView, initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
