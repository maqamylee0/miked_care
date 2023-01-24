import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../features/history/models/message.dart';

class MessageService {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
   Map<String, dynamic> messages ={};
   List chatMessages = [];
//   FirebaseFirestore firebase = FirebaseFirestore.instance;
//   List messages = [];
//    void messages(){
//      messages = firebase.collection("chats")
//          .doc("0G0QwONEzqDSUJoV2TCz")
//          .collection("messages")
//          .orderBy("createdOn",descending: true)
//          .snapshots();
//    }
  Future<List> getAllChats() async {

    var chatDocuments = [];
    chats
        .where('users.$currentUser', isNull: true)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      chatDocuments = snapshot.docs.map((DocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Map<String, dynamic> names = data['names'];
        names.remove(currentUser);

        return {'docid': doc.id, 'name': names.values.first};
      }).toList();
  print("wow ${chatDocuments.length}");
      chatDocuments.forEach((doc) {
        print("heiii"+doc['docid']);
        print("hieii"+doc['name']);

        FirebaseFirestore.instance
            .collection('chats/${doc['docid']}/messages')
            .orderBy('createdOn', descending: true)
            .limit(1)
            .snapshots()
            .listen((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            print('geee ${snapshot.docs.length}');
            messages[doc['name']] = {
              'text': snapshot.docs.first['text'],
              'createdOn': snapshot.docs.first['createdOn'],
              'therapistName': doc['name'],
              // 'therapistUid': snapshot.docs.first['senderId']
            };
            chatMessages.add(messages.values);
          }
        });
      });
    });
    print('loveeeeeeeeee ${chatMessages.length}');
    return chatMessages;
  }
  }
