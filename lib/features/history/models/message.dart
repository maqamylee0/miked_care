import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';
@JsonSerializable()
class Message{
  String? senderId;
  String? text;
  DateTime? createdOn;
  String? therapistName;

  Message({required this.senderId, required this.text, required this.createdOn,required this.therapistName});
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
  // flutter pub run build_runner watch --delete-conflicting-outputs

}