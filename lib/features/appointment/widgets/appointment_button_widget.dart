import 'package:flutter/material.dart';

class Appointment_button extends StatelessWidget {
  const Appointment_button({
    Key? key,  required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(120, 35)),
        padding:  MaterialStateProperty.all(EdgeInsets.fromLTRB(12, 5, 12, 5)),                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(

          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),

          ),

        ),
        side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
          {
            return const BorderSide(color: Colors.grey);
          }
          return null; // Defer to default value on the theme or widget.
        }),
        // shadowColor:MaterialStateProperty.all<Color>(Color.fromRGBO(8, 143, 129, 0.4)) ,
        // elevation: MaterialStateProperty.all<double>(20),
      ),
      onPressed: () {
      },
      child: Text('$title',style: TextStyle(color: Colors.grey, fontSize: 14),),

    );
  }
}
