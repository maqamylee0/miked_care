import 'dart:async';
// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/features/auth/pages/verify_success_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../services/auth.dart';
import '../pages/login_page.dart';

class VerifyOne extends StatefulWidget {
  // final int code;
  const VerifyOne({Key? key}) : super(key: key);

  @override
  State<VerifyOne> createState() => _VerifyOneState();
}

class _VerifyOneState extends State<VerifyOne> {
  TextEditingController textEditingController = TextEditingController();
  bool isVerified = false;
  bool canResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
      sendVerifyEmail();

      timer = Timer.periodic(
          Duration(seconds: 3),
          (_) => {
                checkEmailVerified(),
              });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isVerified
            ? const LoginPage()
            : SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text("Verification",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("A verification link was sent to your email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      )),

                  Text("${FirebaseAuth.instance.currentUser?.email}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text("Edit email address",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),

                  // SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Form(
                              key: formKey,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 30),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 4,
                                    obscureText: true,
                                    obscuringCharacter: '*',

                                    blinkWhenObscuring: true,
                                    animationType: AnimationType.fade,
                                    // validator: (v) {
                                    //   if (v!.length < 3) {
                                    //     return "I'm from validator";
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      fieldHeight: 60,
                                      fieldWidth: 60,
                                      activeFillColor: Colors.white,
                                    ),
                                    cursorColor: Colors.black,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    controller: textEditingController,
                                    keyboardType: TextInputType.number,

                                    onCompleted: (v) {
                                      debugPrint("Completed");
                                    },
                                    // onTap: () {
                                    //   print("Pressed");
                                    // },
                                    onChanged: (value) {
                                      debugPrint(value);
                                      setState(() {
                                        currentText = value;
                                      });
                                    },
                                    beforeTextPaste: (text) {
                                      debugPrint("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    },
                                  )),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                    child: TextButton(
                                  child: const Text("Clear"),
                                  onPressed: () {
                                    textEditingController.clear();
                                  },
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromHeight(
                                        55), // fromHeight use double.infinity as width and 40 is the height
                                  ),
                                  onPressed: () {
                                    onPressed2();
                                  },
                                  child: const Text(
                                    'Verify',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: onPressed,
                                child: Text("Resend code in 18secs")),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )));
  }

  void onPressed() {
    sendVerifyEmail();
    // User? user=FirebaseAuth.instance.currentUser;
    // Auth auth = Auth();
    // auth.sendVerificationCode(context, user?.email);
  }

  void onPressed2() {
    // if(currentText.toString() == widget.code.toString()){
    sendVerifyEmail();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VerifySuccessPage()));
  }

  Future sendVerifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() {
        canResend = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResend = true;
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(msg: '${e.message}');
      // Utils.showSnackBar(e.message);
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isVerified) timer?.cancel();
  }
}
