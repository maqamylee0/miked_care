import 'package:json_annotation/json_annotation.dart';
part 'appointment.g.dart';
@JsonSerializable()
class Appointment{
  String? userId;
  String? therapistId;
  String? therapist;
  String? status;
  String? kind;
  String? type;
  String? date;
  String? time;

  Appointment({ this.userId, this.therapistId,this.therapist,this.status,  this.kind,  this.type,  this.date,  this.time});
  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);


}