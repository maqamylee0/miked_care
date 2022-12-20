import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/auth/widgets/new_password_set.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  var _passwordVisible;
  var _passwordVisible2;

  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userPasswordController2 = TextEditingController();


  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(


          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),

                SizedBox(

                  height: 150,
                  width: 150,
                  child: Image.asset(
                      "assets/logo_black.png", height: 200, width: 300),

                  //Image.asset("assets/img.png")
                ),
                SizedBox(height: 30),

                Text("Set your new password!",textAlign: TextAlign.center, style: TextStyle(color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Your new password must be different from your previous password",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.5)),

                    ],

                  ),
                ),

                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _userPasswordController,
                  obscureText: !_passwordVisible,//This will obscure text dynamically
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Min. of 6 characters',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _userPasswordController2,
                  obscureText: !_passwordVisible2,//This will obscure text dynamically
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Min. of 6 characters',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible2
                            ? Icons.visibility
                            : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible2 = !_passwordVisible2;
                        });
                      },
                    ),
                  ),
                ),



                SizedBox(height: 60),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(
                          55), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      onPressed();
                    },
                    child: const Text('Reset your Password',
                      style: TextStyle(color: Colors.white),)
                ),

              ]
          ),

        )

    ));
  }
  void onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PasswordReset())
    );
  }
  }

