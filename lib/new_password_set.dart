import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children:  [
          SizedBox(height: 30),
          //BACK BUTTON

          SizedBox(
            height: 150,
            width: 150,
            child:Image.asset("assets/logo_black.png",height: 150,width: 150,),
            //Image.asset("assets/img.png")
          ),
          SizedBox(height: 30),
          Container(
            height: deviceHeight*0.10,
            width: deviceHeight*0.15,
            margin: EdgeInsets.symmetric(horizontal: 140),
            decoration: BoxDecoration(
                color: Color(0xFFE7FFE0),
                borderRadius: BorderRadius.circular(7)
            ),
            child: Icon(Icons.check_circle_outline, color: Color(0xFF329A37),size: deviceWidth*0.16,),
          ),
          SizedBox(
            height: 20,
          ),
           Container(
             padding: EdgeInsets.all(20),
               child: Text
            ('Password reset',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              decoration: TextDecoration.none
                ),
          )
          ),
           Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10)
              ,
              child: Text
            ('Your password has been successfully reset\nClick below to login',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                decoration: TextDecoration.none,
                ),
          )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {onPressed();},
                child: const Text('Continue',style: TextStyle(color: Colors.white),)
            ) ,
          )

        ],
      ),
    );
  }

  void onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login())
    );
  }
}