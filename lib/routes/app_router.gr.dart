// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SignOptionsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignOptionsView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChatView(
          cubeUser: args.cubeUser,
          cubeDialog: args.cubeDialog,
        ),
      );
    },
    OtherUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileRouteArgs>(
          orElse: () => const OtherUserProfileRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: OtherUserProfileView(
          key: args.key,
          id: args.id,
          isCurrentUser: args.isCurrentUser,
        ),
      );
    },
    AddAdditionalInformationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddAdditionalInformationView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditProfileView(
          key: args.key,
          isEditProfile: args.isEditProfile,
        ),
      );
    },
    UserBlockListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UserBlockListView(),
      );
    },
    VideoCallRoute.name: (routeData) {
      final args = routeData.argsAs<VideoCallRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VideoCallView(
          key: args.key,
          channelId: args.channelId,
          userName: args.userName,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    UsersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UsersView(),
      );
    },
    ChatListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ChatListView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SignOptionsRoute.name,
          path: '/sign-options-view',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              UsersRoute.name,
              path: 'users-view',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ChatListRoute.name,
              path: 'chat-list-view',
              parent: DashboardRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile-view',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        RouteConfig(
          ChatRoute.name,
          path: '/chat-view',
        ),
        RouteConfig(
          OtherUserProfileRoute.name,
          path: '/other-user-profile-view',
        ),
        RouteConfig(
          AddAdditionalInformationRoute.name,
          path: '/add-additional-information-view',
        ),
        RouteConfig(
          EditProfileRoute.name,
          path: '/edit-profile-view',
        ),
        RouteConfig(
          UserBlockListRoute.name,
          path: '/user-block-list-view',
        ),
        RouteConfig(
          VideoCallRoute.name,
          path: '/video-call-view',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-view',
        ),
      ];
}

/// generated route for
/// [SignOptionsView]
class SignOptionsRoute extends PageRouteInfo<void> {
  const SignOptionsRoute()
      : super(
          SignOptionsRoute.name,
          path: '/sign-options-view',
        );

  static const String name = 'SignOptionsRoute';
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [ChatView]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    CubeUser? cubeUser,
    CubeDialog? cubeDialog,
  }) : super(
          ChatRoute.name,
          path: '/chat-view',
          args: ChatRouteArgs(
            cubeUser: cubeUser,
            cubeDialog: cubeDialog,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.cubeUser,
    this.cubeDialog,
  });

  final CubeUser? cubeUser;

  final CubeDialog? cubeDialog;

  @override
  String toString() {
    return 'ChatRouteArgs{cubeUser: $cubeUser, cubeDialog: $cubeDialog}';
  }
}

/// generated route for
/// [OtherUserProfileView]
class OtherUserProfileRoute extends PageRouteInfo<OtherUserProfileRouteArgs> {
  OtherUserProfileRoute({
    Key? key,
    String? id,
    bool? isCurrentUser = true,
  }) : super(
          OtherUserProfileRoute.name,
          path: '/other-user-profile-view',
          args: OtherUserProfileRouteArgs(
            key: key,
            id: id,
            isCurrentUser: isCurrentUser,
          ),
        );

  static const String name = 'OtherUserProfileRoute';
}

class OtherUserProfileRouteArgs {
  const OtherUserProfileRouteArgs({
    this.key,
    this.id,
    this.isCurrentUser = true,
  });

  final Key? key;

  final String? id;

  final bool? isCurrentUser;

  @override
  String toString() {
    return 'OtherUserProfileRouteArgs{key: $key, id: $id, isCurrentUser: $isCurrentUser}';
  }
}

/// generated route for
/// [AddAdditionalInformationView]
class AddAdditionalInformationRoute extends PageRouteInfo<void> {
  const AddAdditionalInformationRoute()
      : super(
          AddAdditionalInformationRoute.name,
          path: '/add-additional-information-view',
        );

  static const String name = 'AddAdditionalInformationRoute';
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required bool isEditProfile,
  }) : super(
          EditProfileRoute.name,
          path: '/edit-profile-view',
          args: EditProfileRouteArgs(
            key: key,
            isEditProfile: isEditProfile,
          ),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.isEditProfile,
  });

  final Key? key;

  final bool isEditProfile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, isEditProfile: $isEditProfile}';
  }
}

/// generated route for
/// [UserBlockListView]
class UserBlockListRoute extends PageRouteInfo<void> {
  const UserBlockListRoute()
      : super(
          UserBlockListRoute.name,
          path: '/user-block-list-view',
        );

  static const String name = 'UserBlockListRoute';
}

/// generated route for
/// [VideoCallView]
class VideoCallRoute extends PageRouteInfo<VideoCallRouteArgs> {
  VideoCallRoute({
    Key? key,
    required String channelId,
    String? userName,
  }) : super(
          VideoCallRoute.name,
          path: '/video-call-view',
          args: VideoCallRouteArgs(
            key: key,
            channelId: channelId,
            userName: userName,
          ),
        );

  static const String name = 'VideoCallRoute';
}

class VideoCallRouteArgs {
  const VideoCallRouteArgs({
    this.key,
    required this.channelId,
    this.userName,
  });

  final Key? key;

  final String channelId;

  final String? userName;

  @override
  String toString() {
    return 'VideoCallRouteArgs{key: $key, channelId: $channelId, userName: $userName}';
  }
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [UsersView]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute()
      : super(
          UsersRoute.name,
          path: 'users-view',
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [ChatListView]
class ChatListRoute extends PageRouteInfo<void> {
  const ChatListRoute()
      : super(
          ChatListRoute.name,
          path: 'chat-list-view',
        );

  static const String name = 'ChatListRoute';
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-view',
        );

  static const String name = 'ProfileRoute';
}
