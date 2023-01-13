import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/features/auth/pages/login_page.dart';
import 'package:miked_care/features/auth/widgets/verify_code.dart';

import '../../../services/auth.dart';
import '../models/user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showSpinner = false;
  static late final User? user;
  final _auth = FirebaseAuth.instance;
  Auth auth = Auth();
  String? errorMessage;

  var _passwordVisible;
  var _checkboxValue;
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
    _checkboxValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lets get started!",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "Click here if you are a therapist",
                          style: TextStyle(fontSize: 8),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text("Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 70),

                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      validator: (name) =>
                          name != null ? null : "Enter full name",
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        hintText: 'John Doe',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(Icons.person_outline),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _phoneController,
                      validator: (phone) => phone != null && phone.length == 13
                          ? null
                          : "Enter a minimum of 12 digits",
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        hintText: '+234***',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(Icons.phone_outlined),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _emailController,
                      validator: (email) =>
                          email != null && EmailValidator.validate(email)
                              ? null
                              : "Enter valid Email",
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        hintText: 'johndoe@gmail.com',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(Icons.email_outlined),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) =>
                          password != null && password.length > 6
                              ? null
                              : "Enter a minimum of 6 characters",
                      obscureText:
                          !_passwordVisible, //This will obscure text dynamically
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Min of 6 characters',
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

                    // SizedBox(height:3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: _checkboxValue,
                            onChanged: (bool? value) {
                              setState(() {
                                _checkboxValue = value;
                              });
                            }),
                        RichText(
                          text: TextSpan(
                            // Here is the explicit parent TextStyle
                            style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                  text: 'I certify that i agree to the',
                                  style: TextStyle(fontSize: 12)),
                              new TextSpan(
                                  text: ' terms and conditions',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
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
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an Account?"),
                        TextButton(
                            onPressed: () {
                              onPressed2();
                            },
                            child: Text("Sign in"))
                      ],
                    )
                  ]),
            ))));
  }

  void onPressed2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void onPressed() {
    final isValid = formKey.currentState!.validate();

    if (isValid && _checkboxValue == true) {
      Users userModel = Users();
      // writing all the values

      userModel.name = _nameController.text;
      userModel.phone = _phoneController.text;
      print(userModel);

      auth.signUp(_emailController.text, _userPasswordController.text,
          userModel, context);
      errorMessage = auth.errorMessage;
    } else {
      Fluttertoast.showToast(
          msg: "Allow terms and conditions and fill all fields");
    }
  }
}
