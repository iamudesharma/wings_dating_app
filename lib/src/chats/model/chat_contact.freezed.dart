// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) {
  return _ChatContact.fromJson(json);
}

/// @nodoc
mixin _$ChatContact {
  String get name => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get contactId => throw _privateConstructorUsedError;
  DateTime get timeSent => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatContactCopyWith<ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContactCopyWith<$Res> {
  factory $ChatContactCopyWith(
          ChatContact value, $Res Function(ChatContact) then) =
      _$ChatContactCopyWithImpl<$Res, ChatContact>;
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
class _$ChatContactCopyWithImpl<$Res, $Val extends ChatContact>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatContactCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$_ChatContactCopyWith(
          _$_ChatContact value, $Res Function(_$_ChatContact) then) =
      __$$_ChatContactCopyWithImpl<$Res>;
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
class __$$_ChatContactCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$_ChatContact>
    implements _$$_ChatContactCopyWith<$Res> {
  __$$_ChatContactCopyWithImpl(
      _$_ChatContact _value, $Res Function(_$_ChatContact) _then)
      : super(_value, _then);

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
    return _then(_$_ChatContact(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatContact implements _ChatContact {
  const _$_ChatContact(
      {required this.name,
      required this.profilePic,
      required this.contactId,
      required this.timeSent,
      required this.lastMessage,
      required this.fcmToken});

  factory _$_ChatContact.fromJson(Map<String, dynamic> json) =>
      _$$_ChatContactFromJson(json);

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

  @override
  String toString() {
    return 'ChatContact(name: $name, profilePic: $profilePic, contactId: $contactId, timeSent: $timeSent, lastMessage: $lastMessage, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatContact &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePic, contactId,
      timeSent, lastMessage, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatContactCopyWith<_$_ChatContact> get copyWith =>
      __$$_ChatContactCopyWithImpl<_$_ChatContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatContactToJson(
      this,
    );
  }
}

abstract class _ChatContact implements ChatContact {
  const factory _ChatContact(
      {required final String name,
      required final String profilePic,
      required final String contactId,
      required final DateTime timeSent,
      required final String lastMessage,
      required final String fcmToken}) = _$_ChatContact;

  factory _ChatContact.fromJson(Map<String, dynamic> json) =
      _$_ChatContact.fromJson;

  @override
  String get name;
  @override
  String get profilePic;
  @override
  String get contactId;
  @override
  DateTime get timeSent;
  @override
  String get lastMessage;
  @override
  String get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$_ChatContactCopyWith<_$_ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}
