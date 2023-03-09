import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/src/auth/sign_options.dart';
import 'package:wings_dating_app/src/chats/chats_list_view.dart';
import 'package:wings_dating_app/src/profile/edit_profile_view.dart';
import 'package:wings_dating_app/src/profile/add_additional_information_view.dart';

import 'package:wings_dating_app/src/profile/profile_view.dart';
import 'package:wings_dating_app/src/users/users_view.dart';
import '../src/chats/pages/call_view.dart';
import '../src/chats/pages/chat_view.dart';
import '../src/chats/pages/video_call_view.dart';
import '../src/dashboard.dart';
import '../src/login.dart';
import '../src/profile/other_user_profile_view.dart';
import '../src/profile/user_block_list_view.dart';
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
      initial: true,
      guards: [
        AuthGuard,
        // ProfileDocGuard,
      ],
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
    AutoRoute(
      page: ChatView,
    ),
    AutoRoute(
      page: OtherUserProfileView,
    ),
    AutoRoute(
      page: AddAdditionalInformationView,
    ),

    AutoRoute(
      page: CallView,
    ),

    AutoRoute(page: EditProfileView),
    AutoRoute(page: UserBlockListView),
    AutoRoute(page: VideoCallView),

    AutoRoute(
      page: LoginView,
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
