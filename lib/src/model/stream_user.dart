// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class StreamUser {
  final User? user;
  StreamUser({
    this.user,
  });

  StreamUser copyWith({
    User? user,
  }) {
    return StreamUser(
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toJson(),
    };
  }

  factory StreamUser.fromMap(Map<String, dynamic> map) {
    return StreamUser(
      user: map['user'] != null ? User.fromJson(map['user'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamUser.fromJson(String source) => StreamUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StreamUser(user: $user)';

  @override
  bool operator ==(covariant StreamUser other) {
    if (identical(this, other)) return true;

    return other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
