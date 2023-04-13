import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../features/history/models/message.dart';

class MessageService {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  Map<String, dynamic> messages = {};
  List<Map<String, dynamic>> chatMessages = [];

  Future<List<Map<String, dynamic>>> getAllChats() async {
    var chatDocuments = [];
    chats
        .where('users.$currentUser', isNull: true)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      chatDocuments = snapshot.docs.map((DocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Map<String, dynamic> names = data['names'];
        names.remove(currentUser);

        return {'docid': doc.id, 'therapistName': names.values.last, 'patientUid':names.keys.first, 'patientName':names.values.first};
      }).toList();
      // print("wow ${chatDocuments.length}");
      chatDocuments.forEach((doc) {
        // print("heiii" + doc['docid']);
        // print("hieii" + doc['name']);

        FirebaseFirestore.instance
            .collection('chats/${doc['docid']}/messages')
            .orderBy('createdOn', descending: true)
            .limit(1)
            .snapshots()
            .listen((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            // print('geee ${snapshot.docs.length}');
            Timestamp t = snapshot.docs.first['createdOn'];
            DateTime ti = t.toDate();
            var time = DateFormat.jm().format(ti);
            // String time = ' ${ti.add_jm()}';
              messages = {
                'text': snapshot.docs.first['text'],
                'createdOn': time,
                'therapistName': doc['therapistName'],
                'therapistUid': snapshot.docs.first['therapistUid'],
                'patientName': doc['patientName'],
                'patientUid': doc['patientUid']

            };
          }
          chatMessages.add(messages);
        });
      });
    });
    // print('loveeeeeeeeee ${chatMessages}');
    // print('giiii $messages');
    print('sssssssss${chatMessages}');

    return chatMessages;
  }
}
