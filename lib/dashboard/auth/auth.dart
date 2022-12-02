
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/dashboard/views/login.dart';
import 'package:miked_care/dashboard/views/verify_code.dart';

import '../../main.dart';
import '../../survey/survey.dart';
import '../models/user.dart';

class Auth{
  String? errorMessage;

  final _auth = FirebaseAuth.instance;

  Future signUp(String email, String password,userModel,context) async {
    // if (_formKey.currentState!.validate()) {
    try {
      showDialog(context: context,barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()));
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => { postDetailsToFirestore(userModel,context)})
          .catchError((e) {
        Navigator.pop(context);

        Fluttertoast.showToast(msg: e!.message);

      });
    } on FirebaseAuthException catch (error) {

      switch (error.code) {
        case "invalid-email":
           errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }

      Fluttertoast.showToast(msg: errorMessage!);
      Navigator.pop(context);

      print(error.code);
    }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
  postDetailsToFirestore(userModel,context) async {
    User? user=_auth.currentUser;
    userModel.email = user!.email;
    userModel.uid = user!.uid;
    // sendVerificationCode(context, userModel.email );
    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  VerifyOne())

        );
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // box1.put('userid', user!.uid);

    await firebaseFirestore
        .collection("users")
        .doc(userModel.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully :) ");

  }
  Future signIn(context,email,password) async {

    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password:password.trim());

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Survey())

      );
    } on FirebaseException catch(e){
      // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
      Navigator.pop(context);
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(msg:'${e.message}');

    }

    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }

  // Future sendVerificationCode(context, email_receiver) async {
  //   var rng = new Random();
  //   var codeValue = rng.nextInt(9000) + 1000;
  //   final Email email = Email(
  //     body: 'Your verification code is $codeValue',
  //     subject: 'Verification Code',
  //     recipients: [email_receiver],
  //     // attachmentPaths: ['/path/to/attachment.zip'],
  //     isHTML: false,
  //   );
  //
  //   await FlutterEmailSender.send(email);
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) =>  VerifyOne(code:codeValue))
  //
  //   );
  // }
}