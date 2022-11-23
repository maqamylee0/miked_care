import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(


              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200),
                    Text("Check your mail",style:TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.fromLTRB(60, 10, 40, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("We sent a password link to \n"
                              "      johndoe@gmail.com", style: TextStyle(fontSize: 12.5)),

                        ],

                      ),
                    ),


                    SizedBox(height:60),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () {onPressed();},
                        child: const Text('Open Email App',style: TextStyle(color: Colors.white),)
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive mail?"),
                        TextButton(onPressed: onPressed, child: Text("Click to Resend"))
                      ],
                    )
                  ]
              ),

            )

        )
    );
  }

  void onPressed() {}
}
