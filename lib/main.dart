import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/views/login.dart';
import 'package:miked_care/features/views/new_password_set.dart';
import 'package:miked_care/features/views/reset_password.dart';
import 'package:miked_care/features/views/signup.dart';
import 'package:miked_care/slider/welcome_screen.dart';
import 'package:miked_care/slider/welcome_slider.dart';
import 'package:miked_care/features/views/success_verify.dart';
import 'package:miked_care/features/views/verify_code.dart';

import 'features/dashboard/home/views/pages/home.dart';
import 'firebase_options.dart';
final navigatorKey = GlobalKey<NavigatorState>();

void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF16E4E4),
        // secondary: const Color(0xFFFFC107),
        // primaryColor: Colors.cyanAccent,
      )),
      home: Home(),
    );
  }
}

