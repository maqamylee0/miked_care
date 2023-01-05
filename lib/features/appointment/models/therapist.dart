
class Therapist{
  String name;
  String designation;
  String? about;
  List<String> reviewIds;

  Therapist({required this.name, required this.designation, this.about, required this.reviewIds});
}