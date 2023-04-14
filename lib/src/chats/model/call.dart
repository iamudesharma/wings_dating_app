import 'package:freezed_annotation/freezed_annotation.dart';

part 'call.g.dart';
part 'call.freezed.dart';

// @JsonSerializable()
// class Call {
//   final String callerId;
//   final String callerName;
//   final String callerPic;
//   final String receiverId;
//   final String receiverName;
//   final String receiverPic;
//   final String callId;
//   final bool hasDialled;

//   factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

//   Call(this.callerId, this.callerName, this.callerPic, this.receiverId,
//       this.receiverName, this.receiverPic, this.callId, this.hasDialled);
//   Map<String, dynamic> toJson() => _$CallToJson(this);
// }

@freezed
class Call with _$Call {
  const factory Call({
    required String callerId,
    required String callerName,
    required String callerPic,
    required String receiverId,
    required String receiverName,
    required String receiverPic,
    required String callId,
    required bool hasDialled,
  }) = _Call;

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
}
