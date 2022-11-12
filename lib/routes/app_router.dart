import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/src/auth/sign_options.dart';
import 'package:wings_dating_app/src/chats/chats_list_view.dart';
import 'package:wings_dating_app/src/profile/edit_profile_view.dart';
import 'package:wings_dating_app/src/profile/profile_view.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
import '../src/dashboard.dart';
import 'app_router_provider.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: BookListPage, initial: true),
    AutoRoute(
      page: SignOptionsView,
    ),

    AutoRoute(
      page: DashboardView,
      guards: [AuthGuard, ProfileDocGuard],
      initial: true,
      children: [
        AutoRoute(
          page: UsersView,
        ),
        AutoRoute(
          page: ChatListView,
        ),
        AutoRoute(
          page: ProfileView,
        ),
      ],
    ),

    AutoRoute(page: EditProfileView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.profileDocGuard, required super.authGuard});
}
