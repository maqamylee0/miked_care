import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/pages/appoinment_page.dart';
import 'package:miked_care/features/appointment/pages/appointment_form_page.dart';
import 'package:miked_care/features/appointment/pages/book_appointment_page.dart';
import 'package:miked_care/features/auth/pages/login_page.dart';
import 'package:miked_care/features/auth/widgets/new_password_set.dart';
import 'package:miked_care/features/auth/pages/reset_password_page.dart';
import 'package:miked_care/features/auth/pages/sign_up_page.dart';
import 'package:miked_care/features/auth/pages/verify_success_page.dart';
import 'package:miked_care/features/auth/widgets/verify_code.dart';
import 'package:miked_care/features/blogs/pages/blog_detail.dart';
import 'package:miked_care/features/history/pages/message_detail.dart';
import 'package:miked_care/features/homepage/pages/homepage.dart';
import 'package:miked_care/features/profile/pages/about_us.dart';
import 'package:miked_care/features/profile/pages/edit_profile.dart';
import 'package:miked_care/features/profile/pages/faq_page.dart';
import 'package:miked_care/providers/appointment_provider.dart';
import 'package:miked_care/providers/blog_provider.dart';
import 'package:miked_care/providers/message_provider.dart';
import 'package:miked_care/providers/user_provider.dart';
import 'package:provider/provider.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'features/appointment/pages/make_payment_page.dart';
import 'features/blogs/pages/blog_page.dart';
import 'features/dashboard/views/pages/dashboard_page.dart';
import 'features/history/pages/history_page.dart';
import 'features/profile/pages/profile_page.dart';
import 'features/slider/welcome_slider.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  final navigatorKey = GlobalKey<NavigatorState>();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create: (context) => BlogProvider()),
        ChangeNotifierProvider(create: (context) => MessageProvider()),


      ],
      child: MyApp(),
    ));


  //
    //     DevicePreview(builder: (BuildContext context) => MyApp()));
}

class MyApp extends StatelessWidget {
  // final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({super.key, });
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

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
      routes: {
        'home': (context) => const DashboardPage(),
        'AppointmentForm': (context) =>  AppointmentFormPage(),
        'make_payment':(context) => const MakePaymentPage(),
        'sessions':(context) => const AppointmentPage(),
        'profile':(context) => const ProfilePage(),

      },
      home: auth.currentUser != null ? DashboardPage():WelcomeSlider(),
    );
  }
}
