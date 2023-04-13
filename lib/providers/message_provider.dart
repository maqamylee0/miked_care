import 'package:flutter/cupertino.dart';
import 'package:miked_care/services/message_service.dart';

class MessageProvider extends ChangeNotifier{
  String chatDocId = '';
  String therapistName = "";
  late MessageService messageService;
  List<Map<String, dynamic>> chats = [];
  List<Map<String, dynamic>> allChats = [];

  MessageProvider()  {
    messageService = MessageService();
      getAllChats();
  }
  void setchatDocId(String id){
    chatDocId = id;
    notifyListeners();
  }

   Future<void> getAllChats() async {
     // List <String> chatIds = [];
    notifyListeners();
    print('sssssssss${chats.length}');
    chats = await groupChats();

    //
    //  allChats.forEach((element)  {
    //
    //   print('rrrrrrrrrrrrrrrr${element['therapistUid']}');
    //   if (chatIds.contains(element['therapistUid'])){
    //     ;
    //   }else{
    //     chats.add(element);
    //     chatIds.add(element['therapistUid']);
    //   }
    // });
    print('kkkkkkkkkkkkkkkkk ${chats.length}');
    notifyListeners();
   }

  Future<List<Map<String, dynamic>>> groupChats() async {
    List <String> chatIds = [];
    // List<Map<String, dynamic>> chats2 = [];
    allChats = await messageService.getAllChats();

     allChats.forEach((element) {

      print('rrrrrrrrrrrrrrrr${element['therapistUid']}');
      if (chatIds.contains(element['therapistUid'])){
          ;
      }else{
        chats.add(element);
        chatIds.add(element['therapistUid']);
      }
    });
    print('kkkkkkkkkkkkkkkkk $chats');
    notifyListeners();
     return allChats;
   }
}