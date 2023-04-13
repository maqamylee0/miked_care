import 'package:json_annotation/json_annotation.dart';
part 'appointment.g.dart';
@JsonSerializable()
class Appointment{
  String? appointmentId;
  String? userId;
  String? therapistId;
  String? therapist;
  String? status;
  String? kind;
  String? type;
  String? date;
  String? time;
  bool? paid;

  Appointment({ this.appointmentId,this.userId, this.therapistId,this.therapist,this.status,  this.kind,  this.type,  this.date,  this.time,this.paid = false});
  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);


}