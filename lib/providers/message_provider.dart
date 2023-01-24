import 'package:flutter/cupertino.dart';

class MessageProvider extends ChangeNotifier{
  String chatDocId = '';
  String therapistName = "";

  void setchatDocId(String id){
    chatDocId = id;
    notifyListeners();
  }
}