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
    required this.profileDocGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  final ProfileDocGuard profileDocGuard;

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
          guards: [
            authGuard,
            profileDocGuard,
          ],
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
          EditProfileRoute.name,
          path: '/edit-profile-view',
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
