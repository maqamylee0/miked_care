import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/dashboard/views/pages/dashboard_page.dart';

import '../../survey/survey.dart';

class VerifySuccessPage extends StatefulWidget {
  const VerifySuccessPage({Key? key}) : super(key: key);

  @override
  State<VerifySuccessPage> createState() => _VerifySuccessPageState();
}

class _VerifySuccessPageState extends State<VerifySuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Icon(Icons.check_circle_outline_outlined,
              size: 100, color: Colors.cyanAccent),
          SizedBox(
            height: 50,
          ),
          Text(
            "Verification Successful",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(
                      55), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () => onPressed(),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      )),
    );
  }

  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DashboardPage()));
  }
}
