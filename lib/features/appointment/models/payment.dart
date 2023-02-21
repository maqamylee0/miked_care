import 'package:json_annotation/json_annotation.dart';
part 'payment.g.dart';
@JsonSerializable()
class Payment{
  String? userId;
  String? appointmentId;
  // String? cardno;
  // String? mm/yy;
  String? amount;
  String? date;
  String? time;

  Payment({ this.userId, this.appointmentId,  this.amount,  this.date,  this.time, });
  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);


}