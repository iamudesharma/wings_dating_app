import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Ref ref;

  AppRouter(this.ref);

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      keepHistory: true,
      page: DashboardRoute.page,
      path: "/",
      children: [
        RedirectRoute(path: '', redirectTo: 'users'),
        AutoRoute(page: BooksTab.page, path: "user", children: [
          AutoRoute(page: UsersRoute.page, path: "", initial: true),
          AutoRoute(
            page: ChatListRoute.page,
            path: "",
            keepHistory: true,
          ),
          AutoRoute(
            page: ProfileRoute.page,
            keepHistory: true,
            path: "",
          ),
        ])
      ],
      guards: [
        AuthGuard(ref: ref),
      ],
    ),
    AutoRoute(
      page: SignOptionsRoute.page,
      keepHistory: true,
      type: const RouteType.adaptive(),
    ),
    AutoRoute(
      page: OtherUserProfileRoute.page,
      keepHistory: true,
      type: const RouteType.adaptive(),
      path: "/user/:id",
    ),
    AutoRoute(
      page: ChatRoute.page,
      path: "/chat/:cubeUserId",
      keepHistory: true,
    ),
    AutoRoute(
        page: AddAdditionalInformationRoute.page,
        type: const RouteType.adaptive(),
        path: "/add-additional-information"),
    AutoRoute(
        page: EditProfileRoute.page,
        type: const RouteType.adaptive(),
        path: "/edit-profile"),
    AutoRoute(
      page: CallRoute.page,
      type: const RouteType.adaptive(),
    ),
    AutoRoute(
        page: UserBlockListRoute.page,
        type: const RouteType.adaptive(),
        path: "/user-block-list"),
  ];
}

@RoutePage(name: 'BooksTab')
class BooksTabView extends AutoRouter {
  const BooksTabView({super.key});
}
