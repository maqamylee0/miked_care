import 'package:flutter/cupertino.dart';
import 'package:miked_care/services/message_service.dart';

class MessageProvider extends ChangeNotifier{
  String chatDocId = '';
  String therapistName = "";
  late MessageService messageService;
  List chats = [];

  MessageProvider(){
    messageService = MessageService();
    getAllChats();
  }
  void setchatDocId(String id){
    chatDocId = id;
    notifyListeners();
  }

   Future<void> getAllChats() async {
    chats = await messageService.getAllChats();
    print('heloooooooo${chats.length}');
    notifyListeners();
   }
}