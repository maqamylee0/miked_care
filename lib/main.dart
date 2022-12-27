import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/pages/appoinment_page.dart';
import 'package:miked_care/features/auth/pages/login_page.dart';
import 'package:miked_care/features/auth/widgets/new_password_set.dart';
import 'package:miked_care/features/auth/pages/reset_password_page.dart';
import 'package:miked_care/features/auth/pages/sign_up_page.dart';
import 'package:miked_care/features/auth/pages/verify_success_page.dart';
import 'package:miked_care/features/auth/widgets/verify_code.dart';

import 'features/blogs/pages/blog_page.dart';
import 'features/dashboard/views/pages/dashboard_page.dart';
import 'features/history/pages/history_page.dart';
import 'features/slider/welcome_slider.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(builder: (BuildContext context) => MyApp()));
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
        // secondary: const Color(0xFF16E4E4)
        // secondary: const Color(0xFFFFC107),
        // primaryColor: Colors.cyanAccent,
      )),
      home: WelcomeSlider(),

    );
  }
}
