import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/features/views/forgotpassword.dart';
import 'package:miked_care/features/views/signup.dart';
import 'package:miked_care/survey/survey.dart';

import '../auth/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _passwordVisible;
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  Auth auth = Auth();
  final formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:Form(
            key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text("Welcome Back!",style:Theme.of(context).textTheme.headline6,),
                SizedBox(height: 10,),

                Text("Log in", style: TextStyle(color: Colors.black,fontSize: 27,fontWeight: FontWeight.bold)),
                SizedBox(height: 70),


                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email)=>
                  email != null && EmailValidator.validate(email) ?  null:"Enter valid Email",
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'johndoe@gmail.com',
                    // Here is key idea
                    suffixIcon: IconButton(
                      icon: Icon(Icons.person_outline),
                      color: Colors.grey,
                      onPressed: () {
                      },
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _userPasswordController,
                  obscureText: !_passwordVisible,//
                  // This will obscure text dynamically
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password)=>
                  password != null && password.length > 6  ?  null:"Enter a minimum of 6 characters",
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
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
                SizedBox(height:5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(width: 100,),
                    TextButton(onPressed:(){onPressed2();},child:
                    Text("Forgot your password?",style: TextStyle(color: Colors.red)))
                  ],
                ),
                SizedBox(height:60),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {onPressed(_emailController.text,_userPasswordController.text);},
                    child: const Text('Login',style: TextStyle(color: Colors.white),)
                ) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account?"),
                    TextButton(onPressed: onPressed3, child: Text("Sign Up"))
                  ],
                )
              ]
          ),)

        )

    )
    );
    }


  void onPressed(email,password) {
    final isValid = formKey.currentState!.validate();
    if(isValid){

      auth.signIn(context, email, password);

    }else{

      return;
    }
   
  }
  void onPressed2() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPassword())
    );
  }
  void onPressed3() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUp())
    );
  }
}

