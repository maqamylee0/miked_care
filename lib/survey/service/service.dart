import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class SendSurvey{
  late final Box box1;

  Future sendSurvey( data) async {
    box1 = await Hive.openBox('personaldata');
    String userid = box1.get('userid');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("survey")
        .add(data);

    Fluttertoast.showToast(msg: "Data saved successfully");
  }
}