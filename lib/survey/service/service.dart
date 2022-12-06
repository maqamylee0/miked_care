import 'dart:collection';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class SendSurvey{
  // late final Box box1;

  Future sendSurvey( data) async {

    //pick userid from local storage
    final prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.get('userid') as String?;
    // box1 = await Hive.openBox('personaldata');
    // String userid = box1.get('userid');
    // inspect(data);

    List<String> answers = [];
    for (var stepResult in data.results) {
      for (var questionResult in stepResult.results) {
       answers.add(questionResult.valueIdentifier);
      }
    }
    // print(answers);
    // print(userid);
    answers.add(userid!);

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;Map<String,Object> map = new HashMap<String,Object>(); //Object is containing String
    Map <int,String> dat = answers.asMap();


    await firebaseFirestore
        .collection("survey")
        .add(dat);

    Fluttertoast.showToast(msg: "Data saved successfully");
  }
}