import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Users {
  String? uid;
  String? email;
  String? name;
  String? phone;
  String? photoUrl;
  List? fav_blogsIds;

  Users({this.uid, this.email, this.name, this.phone,this.photoUrl,this.fav_blogsIds});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
  // // receiving data from server
  // factory UserModel.fromMap(map) {
  //   return UserModel(
  //     uid: map['uid'],
  //     email: map['email'],
  //     name: map['name'],
  //     phone: map['phone'],
  //     photoUrl: map['photoUrl'],
  //   );
  // }
  //
  // // sending data to our server
  // Map<String, dynamic> toMap() {
  //   return {
  //     'uid': uid,
  //     'email': email,
  //     'name': name,
  //     'phone': phone,
  //     'photoUrl':photoUrl
  //   };
  // }
}