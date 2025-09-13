import 'package:auto_route/auto_route.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:connectycube_sdk/connectycube_sdk.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wings_dating_app/routes/app_router_provider.dart';
import 'package:wings_dating_app/src/ai_wingman/models/model.dart';
import 'package:wings_dating_app/src/album/album_details_view.dart';
import 'package:wings_dating_app/src/album/album_view.dart';
import 'package:wings_dating_app/src/album/create_album_view.dart';
import 'package:wings_dating_app/src/album/widget/image_preview.dart';
import 'package:wings_dating_app/src/login.dart';
import 'package:wings_dating_app/src/users/filters/filters_view.dart';

import '../src/auth/sign_options.dart';
import '../src/ai_wingman/pages/ai_wingman_view.dart';
import '../src/ai_wingman/pages/ai_analysis_view.dart';
import '../src/chats/chats_list_view.dart';
import '../src/chats/pages/chat_view.dart';
import '../src/dashboard.dart';
import '../src/matching/pages/matching_view.dart';
import '../src/profile/add_additional_information_view.dart';
import '../src/profile/edit_profile_view.dart';
import '../src/profile/other_user_profile_view.dart';
import '../src/profile/profile_view.dart';
import '../src/profile/profile_visits_view.dart';
import '../src/profile/user_block_list_view.dart';
import '../src/users/search/search_users_view.dart';
import '../src/users/users_view.dart';
import '../src/notifications/album_requests_view.dart';

part 'app_router.gr.dart';

// @AutoRouterConfig()
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
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
        AutoRoute(page: UsersRoute.page, path: "users", initial: true),
        AutoRoute(page: ChatListRoute.page, path: "chats", keepHistory: true),
        AutoRoute(page: AlbumRoute.page, path: "album", keepHistory: true),
        AutoRoute(page: MatchingRoute.page, path: "matching", keepHistory: true),
        AutoRoute(page: AIChatRoute.page, path: "ai-wingman", keepHistory: true),
        AutoRoute(page: ProfileRoute.page, path: "profile", keepHistory: true),
      ],
      guards: [
        AuthGuard(ref: ref),
      ],
    ),
    AutoRoute(
      page: ChatRoute.page,
      path: "/chat/:id",
      keepHistory: true,
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
      page: SearchUsersRoute.page,
      path: "/search-users",
      keepHistory: true,
    ),
    AutoRoute(
      page: FilterRoute.page,
      path: "/filter-users",
      keepHistory: true,
    ),
    AutoRoute(
        page: AddAdditionalInformationRoute.page,
        type: const RouteType.adaptive(),
        path: "/add-additional-information"),
    AutoRoute(page: EditProfileRoute.page, type: const RouteType.adaptive(), path: "/edit-profile"),
    AutoRoute(
      page: AlbumDetailsRoute.page,
      type: const RouteType.adaptive(),
    ),
    AutoRoute(page: UserBlockListRoute.page, type: const RouteType.adaptive(), path: "/user-block-list"),
    AutoRoute(page: ImagePreviewRoute.page, type: const RouteType.adaptive(), path: "/image:path"),
    AutoRoute(
      page: CreateAlbumRoute.page,
      type: const RouteType.adaptive(),
    ),
    AutoRoute(
      page: ProfileVisitsRoute.page,
      path: "/profile-visits",
      keepHistory: true,
    ),
    AutoRoute(
      page: AIAnalysisRoute.page,
      path: "/ai-analysis",
      keepHistory: true,
    ),
  ];
}
