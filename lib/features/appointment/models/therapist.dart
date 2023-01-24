import 'package:json_annotation/json_annotation.dart';
part 'therapist.g.dart';
@JsonSerializable()
class Therapist{
  String? therapistUid;
  String? name;
  String? designation;
  String? about;
  List<dynamic> reviewIds;

  Therapist({required this.therapistUid,required this.name, required this.designation, this.about, required this.reviewIds});
  factory Therapist.fromJson(Map<String, dynamic> json) => _$TherapistFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistToJson(this);
// flutter pub run build_runner watch --delete-conflicting-outputs

}