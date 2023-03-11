import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';

import '../src/auth/sign_options.dart';
import '../src/chats/chats_list_view.dart';
import '../src/chats/pages/call_view.dart';
import '../src/chats/pages/chat_view.dart';
import '../src/dashboard.dart';
import '../src/profile/add_additional_information_view.dart';
import '../src/profile/edit_profile_view.dart';
import '../src/profile/other_user_profile_view.dart';
import '../src/profile/profile_view.dart';
import '../src/profile/user_block_list_view.dart';
import '../src/users/users_view.dart';

part 'app_router.gr.dart';

// @AutoRouterConfig()
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  final Ref ref;

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(
          page: UsersRoute.page,
        ),
        AutoRoute(
          page: ChatListRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
      ],
      guards: [
        
        // AuthGuard(),
        AuthGuard(),
      ],
      type: const RouteType.material(),
      keepHistory: true,
    ),
    AutoRoute(
      page: SignOptionsRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: ChatRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: OtherUserProfileRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: AddAdditionalInformationRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: EditProfileRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: CallRoute.page,
      type: const RouteType.material(),
    ),
    AutoRoute(
      page: UserBlockListRoute.page,
      type: const RouteType.material(),
    ),
  ];

  AppRouter(this.ref);
}

// @MaterialAutoRouter(
//   replaceInRouteName: 'View,Route',
//   routes: <AutoRoute>[
//     // AutoRoute(page: BookListPage, initial: true),
//     // AutoRoute(
//     //   page: SignOptionsView,
//     // ),
//     AutoRoute(page: [])

//     // AutoRoute(
//     //   page: DashboardView,
//     //   initial: true,
//     //   guards: [
//     //     AuthGuard,
//     //     // ProfileDocGuard,
//     //   ],
//     //   children: [
//     //     AutoRoute(
//     //       page: UsersView,
//     //     ),
//     //     AutoRoute(
//     //       page: ChatListView,
//     //     ),
//     //     AutoRoute(
//     //       page: ProfileView,
//     //     ),
//     //   ],
//     // ),
//     // AutoRoute(
//     //   page: ChatView,
//     // ),
//     // AutoRoute(
//     //   page: OtherUserProfileView,
//     // ),
//     // AutoRoute(
//     //   page: AddAdditionalInformationView,
//     // ),

//     // AutoRoute(
//     //   page: CallView,
//     // ),

//     // AutoRoute(page: EditProfileView),
//     // AutoRoute(page: UserBlockListView),
//     // AutoRoute(page: VideoCallView),

//     // AutoRoute(
//     //   page: LoginView,
//     // ),
//   ],
// )
// // extend the generated private router
// class AppRouter extends _$AppRouter {
//   AppRouter({required super.authGuard});
// }

// class MaterialAutoRouter {
//   const MaterialAutoRouter(
//       {required String replaceInRouteName, required List<AutoRoute> routes});
// }
