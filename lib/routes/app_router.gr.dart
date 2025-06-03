// dart format width=80
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
    : super(AddAdditionalInformationRoute.name, initialChildren: children);

  static const String name = 'AddAdditionalInformationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddAdditionalInformationView();
    },
  );
}

/// generated route for
/// [AlbumDetailsView]
class AlbumDetailsRoute extends PageRouteInfo<AlbumDetailsRouteArgs> {
  AlbumDetailsRoute({
    Key? key,
    required String id,
    bool isPreview = false,
    Channel? channel,
    List<PageRouteInfo>? children,
  }) : super(
         AlbumDetailsRoute.name,
         args: AlbumDetailsRouteArgs(
           key: key,
           id: id,
           isPreview: isPreview,
           channel: channel,
         ),
         initialChildren: children,
       );

  static const String name = 'AlbumDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AlbumDetailsRouteArgs>();
      return AlbumDetailsView(
        key: args.key,
        id: args.id,
        isPreview: args.isPreview,
        channel: args.channel,
      );
    },
  );
}

class AlbumDetailsRouteArgs {
  const AlbumDetailsRouteArgs({
    this.key,
    required this.id,
    this.isPreview = false,
    this.channel,
  });

  final Key? key;

  final String id;

  final bool isPreview;

  final Channel? channel;

  @override
  String toString() {
    return 'AlbumDetailsRouteArgs{key: $key, id: $id, isPreview: $isPreview, channel: $channel}';
  }
}

/// generated route for
/// [AlbumView]
class AlbumRoute extends PageRouteInfo<void> {
  const AlbumRoute({List<PageRouteInfo>? children})
    : super(AlbumRoute.name, initialChildren: children);

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
    : super(BooksTab.name, initialChildren: children);

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
    : super(ChatListRoute.name, initialChildren: children);

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
    required Channel channel,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(key: key, channel: channel, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return ChatView(key: args.key, channel: args.channel, id: args.id);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.channel, required this.id});

  final Key? key;

  final Channel channel;

  final String id;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, channel: $channel, id: $id}';
  }
}

/// generated route for
/// [CreateAlbumView]
class CreateAlbumRoute extends PageRouteInfo<CreateAlbumRouteArgs> {
  CreateAlbumRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
         CreateAlbumRoute.name,
         args: CreateAlbumRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CreateAlbumRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAlbumRouteArgs>();
      return CreateAlbumView(key: args.key, id: args.id);
    },
  );
}

class CreateAlbumRouteArgs {
  const CreateAlbumRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'CreateAlbumRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

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
         args: EditProfileRouteArgs(key: key, isEditProfile: isEditProfile),
         initialChildren: children,
       );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return EditProfileView(key: args.key, isEditProfile: args.isEditProfile);
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.isEditProfile});

  final Key? key;

  final bool isEditProfile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, isEditProfile: $isEditProfile}';
  }
}

/// generated route for
/// [FilterView]
class FilterRoute extends PageRouteInfo<void> {
  const FilterRoute({List<PageRouteInfo>? children})
    : super(FilterRoute.name, initialChildren: children);

  static const String name = 'FilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FilterView();
    },
  );
}

/// generated route for
/// [ImagePreviewView]
class ImagePreviewRoute extends PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    Key? key,
    required String path,
    List<PageRouteInfo>? children,
  }) : super(
         ImagePreviewRoute.name,
         args: ImagePreviewRouteArgs(key: key, path: path),
         rawPathParams: {'path': path},
         initialChildren: children,
       );

  static const String name = 'ImagePreviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ImagePreviewRouteArgs>(
        orElse: () => ImagePreviewRouteArgs(path: pathParams.getString('path')),
      );
      return ImagePreviewView(key: args.key, path: args.path);
    },
  );
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({this.key, required this.path});

  final Key? key;

  final String path;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [MatchingView]
class MatchingRoute extends PageRouteInfo<void> {
  const MatchingRoute({List<PageRouteInfo>? children})
    : super(MatchingRoute.name, initialChildren: children);

  static const String name = 'MatchingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MatchingView();
    },
  );
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
        orElse: () => OtherUserProfileRouteArgs(id: pathParams.optString('id')),
      );
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
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileView();
    },
  );
}

/// generated route for
/// [SearchUsersView]
class SearchUsersRoute extends PageRouteInfo<void> {
  const SearchUsersRoute({List<PageRouteInfo>? children})
    : super(SearchUsersRoute.name, initialChildren: children);

  static const String name = 'SearchUsersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchUsersView();
    },
  );
}

/// generated route for
/// [SignOptionsView]
class SignOptionsRoute extends PageRouteInfo<void> {
  const SignOptionsRoute({List<PageRouteInfo>? children})
    : super(SignOptionsRoute.name, initialChildren: children);

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
    : super(UserBlockListRoute.name, initialChildren: children);

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
    : super(UsersRoute.name, initialChildren: children);

  static const String name = 'UsersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UsersView();
    },
  );
}
