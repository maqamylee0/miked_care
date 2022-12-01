import 'package:flutter/material.dart';
import 'package:miked_care/dashboard/views/login.dart';
import 'package:miked_care/dashboard/views/new_password_set.dart';
import 'package:miked_care/dashboard/views/reset_password.dart';
import 'package:miked_care/dashboard/views/signup.dart';
import 'package:miked_care/slider/welcome_screen.dart';
import 'package:miked_care/slider/welcome_slider.dart';
import 'package:miked_care/dashboard/views/success_verify.dart';
import 'package:miked_care/dashboard/views/verify_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF16E4E4),
        // secondary: const Color(0xFFFFC107),
        // primaryColor: Colors.cyanAccent,
      )),
      home: WelcomeSlider(),
    );
  }
}

