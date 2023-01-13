import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key? key,
    required this.image_path,
  }) : super(key: key);
  final String image_path;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.transparent,
      child: SizedBox(
          width: 90,
          height: 90,
          child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: "$image_path",
                height: 200,
                width: 200,
              ))),
    );
  }
}