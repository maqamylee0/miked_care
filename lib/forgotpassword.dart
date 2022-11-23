import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miked_care/checkmail.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(


              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),

                    SizedBox(
                      height: 100,
                      width: 200,
                      child: SvgPicture.asset("assets/logo.svg",height: 100,width: 100,),
                    ),

                    Text("Forgot Password!",style:TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Enter your e-mail address to get a link to \n"
                              "               reset your password", style: TextStyle(fontSize: 12.5)),

                        ],

                      ),
                    ),

                    SizedBox(height: 70),


                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'johndoe@gmail.com',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(Icons.email_outlined),
                          color: Colors.grey,
                          onPressed: () {
                          },
                        ),
                      ),
                    ),


                    SizedBox(height:60),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () {onPressed();},
                        child: const Text('Reset your Password',style: TextStyle(color: Colors.white),)
                    ) ,

                  ]
              ),

            )

        )
    );
  }

  void onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CheckEmail())
    );
  }
}
