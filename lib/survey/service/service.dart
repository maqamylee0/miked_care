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
    // Map <int,String> dat = answers.asMap();
    print(answers);
    Map<String,String> result;
    if (answers[1] == 'Yes'){
       result = {
        'uid':userid,
        'type':'Therapist',
        'How old are you':answers[3],
        'Do you provide perinatal mental health care services':answers[4],
        'Years of Experience':answers[5],
        'Up to date license of practice':answers[6],
        'Understand Importance of confidentiality':answers[7],
        'Willingness to be wxtra patient and execcute appropriate ethics':answers[8],
        'Ever had a legal issue in relation to your practice':answers[9],
        'Recently reviewed your mental health as a mental health care provider':answers[10],
        'Willingness to provide certifications for vetting':answers[11],
        'Relevant documents':answers[12],
        'Understand we are social enterprise and are willing to reduce your fees to accomodate clients':answers[13],
        'Access to good internet':answers[14],
      };

    }else{
      if(answers[2]== '1'){
       result = {
        'uid': userid,
        'Age': answers[4],
        'type':'Postpatum',
        'Able to laugh and see the funny side of things': answers[5],
        'Able to look forward with excitement to things?': answers[6],
        'Blamed myself unnecessarily, especially when things go wrong?': answers[7],
        'Been anxious & worried for no good reason?': answers[8],
        'Things have been getting on top of me?': answers[9],
        'Been so unhappy that you have difficulty sleeping?': answers[10],
        'Been so unhappy that you have been crying?': answers[11],
        'Thoughts of harming myself & my baby has occurred to me?': answers[12],
        'Worried about the safety of my baby?': answers[13],
        'Felt sad & miserable?': answers[14],
        'Attend antenatal clinic religiously?': answers[15],
      };
      } else if( answers[2] == '3') {
        result = {
          'uid': userid,
          'Age': answers[4],
          'type':'Preconception',
          'Heard of preconception care?': answers[5],
          'Think you are ready to conceive?': answers[6],
          'Fears about being a good mother or experiencing a healthy pregnancy?': answers[7],
          'Felt scared for no good reason in the last 2 weeks?': answers[8],
          'Think you will get support from your spouse & family during pregnancy?': answers[9],
          'Been so unhappy that find yourself crying?': answers[10],
          'Understand that every pregnancy is unique and may result in different outcomes?': answers[11],
          'Medical History that can pose as risk to your Pregnancy': answers[12],
        };

      }else{
        result = {
          'uid': userid,
          'Age': answers[4],
          'type':'Pregnancy',
          'Been able to laugh and see the funny side of things?':answers[5],
          'Been able to look forward with excitement to things?':answers[6],
          'Blamed myself unnecessarily, especially when things go wrong?':answers[7],
          'Been anxious & worried for no good reason?':answers[8],
          'Things have been getting on top of me?':answers[9],
          'Been so unhappy that you have difficulty sleeping?':answers[10],
          'Been so unhappy that you have been crying?':answers[11],
          'Thoughts of harming myself & my baby has occurred to me?':answers[12],
          'Worried about the safety of my baby?':answers[13],
          'Felt sad & miserable?':answers[14],
          'Attend antenatal clinic religiously?':answers[15],
        };

      }

    }
    await firebaseFirestore
        .collection("survey")
        .add(result);

    Fluttertoast.showToast(msg: "Data saved successfully");
  }
}