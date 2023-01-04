import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatefulWidget {
  const LargeButton({Key? key, required this.title, required this.path}) : super(key: key);
  final String title;
  final String path;
  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
              55), // fromHeight use double.infinity as width and 40 is the height
        ),
        onPressed: () {
          Navigator.pushNamed(context, '${widget.path}');
        },
        child:  Text(
          '${widget.title}',
          style: TextStyle(color: Colors.white,fontSize: 24),
        ));
  }
}
