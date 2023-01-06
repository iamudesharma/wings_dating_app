// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get senderId => throw _privateConstructorUsedError;
  String get recieverid => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  MessageEnum get type => throw _privateConstructorUsedError;
  @FirestoreTimestampConverter()
  DateTime get timeSent => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;
  String? get repliedMessage => throw _privateConstructorUsedError;
  String? get repliedTo => throw _privateConstructorUsedError;
  MessageEnum? get repliedMessageType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String senderId,
      String recieverid,
      String text,
      MessageEnum type,
      @FirestoreTimestampConverter() DateTime timeSent,
      String messageId,
      bool isSeen,
      String? repliedMessage,
      String? repliedTo,
      MessageEnum? repliedMessageType});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? recieverid = null,
    Object? text = null,
    Object? type = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
    Object? repliedMessage = freezed,
    Object? repliedTo = freezed,
    Object? repliedMessageType = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverid: null == recieverid
          ? _value.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedMessageType: freezed == repliedMessageType
          ? _value.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderId,
      String recieverid,
      String text,
      MessageEnum type,
      @FirestoreTimestampConverter() DateTime timeSent,
      String messageId,
      bool isSeen,
      String? repliedMessage,
      String? repliedTo,
      MessageEnum? repliedMessageType});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? recieverid = null,
    Object? text = null,
    Object? type = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
    Object? repliedMessage = freezed,
    Object? repliedTo = freezed,
    Object? repliedMessageType = freezed,
  }) {
    return _then(_$_Message(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverid: null == recieverid
          ? _value.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: freezed == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedMessageType: freezed == repliedMessageType
          ? _value.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.senderId,
      required this.recieverid,
      required this.text,
      required this.type,
      @FirestoreTimestampConverter() required this.timeSent,
      required this.messageId,
      required this.isSeen,
      this.repliedMessage,
      this.repliedTo,
      this.repliedMessageType});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String senderId;
  @override
  final String recieverid;
  @override
  final String text;
  @override
  final MessageEnum type;
  @override
  @FirestoreTimestampConverter()
  final DateTime timeSent;
  @override
  final String messageId;
  @override
  final bool isSeen;
  @override
  final String? repliedMessage;
  @override
  final String? repliedTo;
  @override
  final MessageEnum? repliedMessageType;

  @override
  String toString() {
    return 'Message(senderId: $senderId, recieverid: $recieverid, text: $text, type: $type, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen, repliedMessage: $repliedMessage, repliedTo: $repliedTo, repliedMessageType: $repliedMessageType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.recieverid, recieverid) ||
                other.recieverid == recieverid) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.repliedMessage, repliedMessage) ||
                other.repliedMessage == repliedMessage) &&
            (identical(other.repliedTo, repliedTo) ||
                other.repliedTo == repliedTo) &&
            (identical(other.repliedMessageType, repliedMessageType) ||
                other.repliedMessageType == repliedMessageType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      recieverid,
      text,
      type,
      timeSent,
      messageId,
      isSeen,
      repliedMessage,
      repliedTo,
      repliedMessageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String senderId,
      required final String recieverid,
      required final String text,
      required final MessageEnum type,
      @FirestoreTimestampConverter() required final DateTime timeSent,
      required final String messageId,
      required final bool isSeen,
      final String? repliedMessage,
      final String? repliedTo,
      final MessageEnum? repliedMessageType}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get senderId;
  @override
  String get recieverid;
  @override
  String get text;
  @override
  MessageEnum get type;
  @override
  @FirestoreTimestampConverter()
  DateTime get timeSent;
  @override
  String get messageId;
  @override
  bool get isSeen;
  @override
  String? get repliedMessage;
  @override
  String? get repliedTo;
  @override
  MessageEnum? get repliedMessageType;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
