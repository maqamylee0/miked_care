import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miked_care/features/appointment/pages/appoinment_page.dart';
import 'package:miked_care/features/blogs/pages/blog_page.dart';
import 'package:miked_care/features/history/pages/history_page.dart';
import 'package:miked_care/features/profile/pages/profile_page.dart';

import '../../../homepage/pages/homepage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          HomePage(),
          AppointmentPage(),
          HistoryPage(),
          BlogPage(),
          ProfilePage()
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.rectangleList,
                color: Colors.black,
              ),
              label: "Appointment"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.clock,
                color: Colors.black,
              ),
              label: "History"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.quoteRight,
                color: Colors.black,
              ),
              label: "Blogs"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
              label: "Profile")
        ],
      ),
    );
  }
}
