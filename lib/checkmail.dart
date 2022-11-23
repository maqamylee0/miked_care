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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text("Welcome Back!",style:Theme.of(context).textTheme.headline6,),
                    SizedBox(height: 10,),

                    Text("Log in", style: TextStyle(color: Colors.black,fontSize: 27,fontWeight: FontWeight.bold)),
                    SizedBox(height: 70),





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
