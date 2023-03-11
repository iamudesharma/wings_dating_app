// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SignOptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignOptionsView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    OtherUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileRouteArgs>(
          orElse: () => const OtherUserProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtherUserProfileView(
          key: args.key,
          id: args.id,
          isCurrentUser: args.isCurrentUser,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    UserBlockListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserBlockListView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfileView(
          key: args.key,
          isEditProfile: args.isEditProfile,
        ),
      );
    },
    AddAdditionalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddAdditionalInformationView(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersView(),
      );
    },
    ChatListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatListView(),
      );
    },
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatView(
          key: args.key,
          cubeUser: args.cubeUser,
          cubeDialog: args.cubeDialog,
          chatUserCubeId: args.chatUserCubeId,
          dialogId: args.dialogId,
          cubeUserId: args.cubeUserId,
        ),
      );
    },
    CallRoute.name: (routeData) {
      final args = routeData.argsAs<CallRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CallView(
          args.callSession,
          args.isIncoming,
        ),
      );
    },
  };
}

/// generated route for
/// [SignOptionsView]
class SignOptionsRoute extends PageRouteInfo<void> {
  const SignOptionsRoute({List<PageRouteInfo>? children})
      : super(
          SignOptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignOptionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtherUserProfileView]
class OtherUserProfileRoute extends PageRouteInfo<OtherUserProfileRouteArgs> {
  OtherUserProfileRoute({
    Key? key,
    String? id,
    bool? isCurrentUser = true,
    List<PageRouteInfo>? children,
  }) : super(
          OtherUserProfileRoute.name,
          args: OtherUserProfileRouteArgs(
            key: key,
            id: id,
            isCurrentUser: isCurrentUser,
          ),
          initialChildren: children,
        );

  static const String name = 'OtherUserProfileRoute';

  static const PageInfo<OtherUserProfileRouteArgs> page =
      PageInfo<OtherUserProfileRouteArgs>(name);
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
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserBlockListView]
class UserBlockListRoute extends PageRouteInfo<void> {
  const UserBlockListRoute({List<PageRouteInfo>? children})
      : super(
          UserBlockListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserBlockListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required bool isEditProfile,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(
            key: key,
            isEditProfile: isEditProfile,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
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
/// [AddAdditionalInformationView]
class AddAdditionalInformationRoute extends PageRouteInfo<void> {
  const AddAdditionalInformationRoute({List<PageRouteInfo>? children})
      : super(
          AddAdditionalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAdditionalInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersView]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatListView]
class ChatListRoute extends PageRouteInfo<void> {
  const ChatListRoute({List<PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatView]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    CubeUser? cubeUser,
    CubeDialog? cubeDialog,
    int? chatUserCubeId,
    String? dialogId,
    int? cubeUserId,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            cubeUser: cubeUser,
            cubeDialog: cubeDialog,
            chatUserCubeId: chatUserCubeId,
            dialogId: dialogId,
            cubeUserId: cubeUserId,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    this.cubeUser,
    this.cubeDialog,
    this.chatUserCubeId,
    this.dialogId,
    this.cubeUserId,
  });

  final Key? key;

  final CubeUser? cubeUser;

  final CubeDialog? cubeDialog;

  final int? chatUserCubeId;

  final String? dialogId;

  final int? cubeUserId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, cubeUser: $cubeUser, cubeDialog: $cubeDialog, chatUserCubeId: $chatUserCubeId, dialogId: $dialogId, cubeUserId: $cubeUserId}';
  }
}

/// generated route for
/// [CallView]
class CallRoute extends PageRouteInfo<CallRouteArgs> {
  CallRoute({
    required P2PSession callSession,
    required bool isIncoming,
    List<PageRouteInfo>? children,
  }) : super(
          CallRoute.name,
          args: CallRouteArgs(
            callSession: callSession,
            isIncoming: isIncoming,
          ),
          initialChildren: children,
        );

  static const String name = 'CallRoute';

  static const PageInfo<CallRouteArgs> page = PageInfo<CallRouteArgs>(name);
}

class CallRouteArgs {
  const CallRouteArgs({
    required this.callSession,
    required this.isIncoming,
  });

  final P2PSession callSession;

  final bool isIncoming;

  @override
  String toString() {
    return 'CallRouteArgs{callSession: $callSession, isIncoming: $isIncoming}';
  }
}
