// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {
  String get senderId;
  String get recieverid;
  String get text;
  MessageEnum get type;
  @FirestoreTimestampConverter()
  DateTime get timeSent;
  String get messageId;
  bool get isSeen;
  String? get repliedMessage;
  String? get repliedTo;
  MessageEnum? get repliedMessageType;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Message &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'Message(senderId: $senderId, recieverid: $recieverid, text: $text, type: $type, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen, repliedMessage: $repliedMessage, repliedTo: $repliedTo, repliedMessageType: $repliedMessageType)';
  }
}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) =
      _$MessageCopyWithImpl;
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
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverid: null == recieverid
          ? _self.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _self.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _self.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _self.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedMessageType: freezed == repliedMessageType
          ? _self.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Message implements Message {
  const _Message(
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
  factory _Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

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

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'Message(senderId: $senderId, recieverid: $recieverid, text: $text, type: $type, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen, repliedMessage: $repliedMessage, repliedTo: $repliedTo, repliedMessageType: $repliedMessageType)';
  }
}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) =
      __$MessageCopyWithImpl;
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
class __$MessageCopyWithImpl<$Res> implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Message(
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverid: null == recieverid
          ? _self.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _self.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageId: null == messageId
          ? _self.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _self.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: freezed == repliedMessage
          ? _self.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedTo: freezed == repliedTo
          ? _self.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedMessageType: freezed == repliedMessageType
          ? _self.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum?,
    ));
  }
}

// dart format on
