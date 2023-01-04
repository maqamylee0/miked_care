import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularAvator extends StatelessWidget {
  final String image_path;

  const CircularAvator({
    Key? key,
    required this.image_path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.transparent,
      child: SizedBox(
          width: 90,
          height: 90,
          child: ClipOval(
              child: Image.asset(
                "${image_path}",
                height: 200,
                width: 200,
              ))),
    );
  }
}