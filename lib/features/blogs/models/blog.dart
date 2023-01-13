
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blog.g.dart';
@JsonSerializable()
class Blog{
  String? title;
  String? date;
  String? imageUrl;
  String? content;
  Blog({this.title,this.date,this.imageUrl,this.content});
  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}