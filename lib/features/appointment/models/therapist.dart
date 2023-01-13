import 'package:json_annotation/json_annotation.dart';
part 'therapist.g.dart';
@JsonSerializable()
class Therapist{
  String? name;
  String? designation;
  String? about;
  List<dynamic> reviewIds;

  Therapist({required this.name, required this.designation, this.about, required this.reviewIds});
  factory Therapist.fromJson(Map<String, dynamic> json) => _$TherapistFromJson(json);

  Map<String, dynamic> toJson() => _$TherapistToJson(this);
  // factory Therapist.fromJson(Map<String, dynamic> map) {
  //   return Therapist(
  //     name: map['name'],
  //     designation: map['designation'],
  //     about: map['about'],
  //     reviewIds: map['reviewIds'],
  //
  //   );
  // }
}