// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatContact {
  String get name;
  String get profilePic;
  String get contactId;
  DateTime get timeSent;
  String get lastMessage;
  String get fcmToken;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatContactCopyWith<ChatContact> get copyWith =>
      _$ChatContactCopyWithImpl<ChatContact>(this as ChatContact, _$identity);

  /// Serializes this ChatContact to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatContact &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePic, contactId,
      timeSent, lastMessage, fcmToken);

  @override
  String toString() {
    return 'ChatContact(name: $name, profilePic: $profilePic, contactId: $contactId, timeSent: $timeSent, lastMessage: $lastMessage, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class $ChatContactCopyWith<$Res> {
  factory $ChatContactCopyWith(
          ChatContact value, $Res Function(ChatContact) _then) =
      _$ChatContactCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String profilePic,
      String contactId,
      DateTime timeSent,
      String lastMessage,
      String fcmToken});
}

/// @nodoc
class _$ChatContactCopyWithImpl<$Res> implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._self, this._then);

  final ChatContact _self;
  final $Res Function(ChatContact) _then;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? contactId = null,
    Object? timeSent = null,
    Object? lastMessage = null,
    Object? fcmToken = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _self.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _self.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _self.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastMessage: null == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatContact implements ChatContact {
  const _ChatContact(
      {required this.name,
      required this.profilePic,
      required this.contactId,
      required this.timeSent,
      required this.lastMessage,
      required this.fcmToken});
  factory _ChatContact.fromJson(Map<String, dynamic> json) =>
      _$ChatContactFromJson(json);

  @override
  final String name;
  @override
  final String profilePic;
  @override
  final String contactId;
  @override
  final DateTime timeSent;
  @override
  final String lastMessage;
  @override
  final String fcmToken;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatContactCopyWith<_ChatContact> get copyWith =>
      __$ChatContactCopyWithImpl<_ChatContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatContactToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatContact &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePic, contactId,
      timeSent, lastMessage, fcmToken);

  @override
  String toString() {
    return 'ChatContact(name: $name, profilePic: $profilePic, contactId: $contactId, timeSent: $timeSent, lastMessage: $lastMessage, fcmToken: $fcmToken)';
  }
}

/// @nodoc
abstract mixin class _$ChatContactCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$ChatContactCopyWith(
          _ChatContact value, $Res Function(_ChatContact) _then) =
      __$ChatContactCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String profilePic,
      String contactId,
      DateTime timeSent,
      String lastMessage,
      String fcmToken});
}

/// @nodoc
class __$ChatContactCopyWithImpl<$Res> implements _$ChatContactCopyWith<$Res> {
  __$ChatContactCopyWithImpl(this._self, this._then);

  final _ChatContact _self;
  final $Res Function(_ChatContact) _then;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? contactId = null,
    Object? timeSent = null,
    Object? lastMessage = null,
    Object? fcmToken = null,
  }) {
    return _then(_ChatContact(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _self.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _self.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _self.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastMessage: null == lastMessage
          ? _self.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
