// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddAdditionalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddAdditionalInformationView(),
      );
    },
    BooksTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BooksTabView(),
      );
    },
    CallRoute.name: (routeData) {
      final args = routeData.argsAs<CallRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CallView(
          args.callSession,
          args.isIncoming,
          key: args.key,
        ),
      );
    },
    ChatListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatListView(),
      );
    },
    ChatRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatRouteArgs>(
          orElse: () =>
              ChatRouteArgs(cubeUserId: pathParams.optInt('cubeUserId')));
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
    ChatRouteProvider.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChatRouteProviderArgs>(
          orElse: () => ChatRouteProviderArgs(
              cubeUserId: pathParams.optInt('cubeUserId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatViewProvider(
          key: args.key,
          cubeUser: args.cubeUser,
          cubeDialog: args.cubeDialog,
          chatUserCubeId: args.chatUserCubeId,
          dialogId: args.dialogId,
          cubeUserId: args.cubeUserId,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
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
    OtherUserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OtherUserProfileRouteArgs>(
          orElse: () =>
              OtherUserProfileRouteArgs(id: pathParams.optString('id')));
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
    SignOptionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignOptionsView(),
      );
    },
    UserBlockListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserBlockListView(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersView(),
      );
    },
  };
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
/// [BooksTabView]
class BooksTab extends PageRouteInfo<void> {
  const BooksTab({List<PageRouteInfo>? children})
      : super(
          BooksTab.name,
          initialChildren: children,
        );

  static const String name = 'BooksTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CallView]
class CallRoute extends PageRouteInfo<CallRouteArgs> {
  CallRoute({
    required P2PSession callSession,
    required bool isIncoming,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CallRoute.name,
          args: CallRouteArgs(
            callSession: callSession,
            isIncoming: isIncoming,
            key: key,
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
    this.key,
  });

  final P2PSession callSession;

  final bool isIncoming;

  final Key? key;

  @override
  String toString() {
    return 'CallRouteArgs{callSession: $callSession, isIncoming: $isIncoming, key: $key}';
  }
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
          rawPathParams: {'cubeUserId': cubeUserId},
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
/// [ChatViewProvider]
class ChatRouteProvider extends PageRouteInfo<ChatRouteProviderArgs> {
  ChatRouteProvider({
    Key? key,
    CubeUser? cubeUser,
    CubeDialog? cubeDialog,
    int? chatUserCubeId,
    String? dialogId,
    int? cubeUserId,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRouteProvider.name,
          args: ChatRouteProviderArgs(
            key: key,
            cubeUser: cubeUser,
            cubeDialog: cubeDialog,
            chatUserCubeId: chatUserCubeId,
            dialogId: dialogId,
            cubeUserId: cubeUserId,
          ),
          rawPathParams: {'cubeUserId': cubeUserId},
          initialChildren: children,
        );

  static const String name = 'ChatRouteProvider';

  static const PageInfo<ChatRouteProviderArgs> page =
      PageInfo<ChatRouteProviderArgs>(name);
}

class ChatRouteProviderArgs {
  const ChatRouteProviderArgs({
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
    return 'ChatRouteProviderArgs{key: $key, cubeUser: $cubeUser, cubeDialog: $cubeDialog, chatUserCubeId: $chatUserCubeId, dialogId: $dialogId, cubeUserId: $cubeUserId}';
  }
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
          rawPathParams: {'id': id},
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
