import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';
@JsonSerializable()
class Review{
  String? reviewId;
  String? userId;
  String? message;
  String? date;
  double? rating;


  Review({required this.reviewId,required this.userId, required this.message, required this.date, required this.rating});
  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
  // factory Review.fromJson(Map<String, dynamic> map) {
  //   return Review(
  //     reviewId: map['reviewId'],
  //     userId: map['userId'],
  //     message: map['message'],
  //     date: map['date'],
  //     rating: map['rating'],
  //
  //   );
  // }

}