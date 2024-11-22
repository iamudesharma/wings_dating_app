// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddAdditionalInformationView]
class AddAdditionalInformationRoute extends PageRouteInfo<void> {
  const AddAdditionalInformationRoute({List<PageRouteInfo>? children})
      : super(
          AddAdditionalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAdditionalInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddAdditionalInformationView();
    },
  );
}

/// generated route for
/// [AlbumView]
class AlbumRoute extends PageRouteInfo<void> {
  const AlbumRoute({List<PageRouteInfo>? children})
      : super(
          AlbumRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlbumRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AlbumView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BooksTabView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatListView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChatRouteArgs>(
          orElse: () =>
              ChatRouteArgs(cubeUserId: pathParams.optInt('cubeUserId')));
      return ChatView(
        key: args.key,
        cubeUser: args.cubeUser,
        cubeDialog: args.cubeDialog,
        chatUserCubeId: args.chatUserCubeId,
        dialogId: args.dialogId,
        cubeUserId: args.cubeUserId,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChatRouteProviderArgs>(
          orElse: () => ChatRouteProviderArgs(
              cubeUserId: pathParams.optInt('cubeUserId')));
      return ChatViewProvider(
        key: args.key,
        cubeUser: args.cubeUser,
        cubeDialog: args.cubeDialog,
        chatUserCubeId: args.chatUserCubeId,
        dialogId: args.dialogId,
        cubeUserId: args.cubeUserId,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return EditProfileView(
        key: args.key,
        isEditProfile: args.isEditProfile,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OtherUserProfileRouteArgs>(
          orElse: () =>
              OtherUserProfileRouteArgs(id: pathParams.optString('id')));
      return OtherUserProfileView(
        key: args.key,
        id: args.id,
        isCurrentUser: args.isCurrentUser,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignOptionsView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserBlockListView();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UsersView();
    },
  );
}
