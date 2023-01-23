// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
//
// import '../features/history/models/message.dart';
//
// class MessageService {
//
//   FirebaseFirestore firebase = FirebaseFirestore.instance;
//   List messages = [];
//    void messages(){
//      messages = firebase.collection("chats")
//          .doc("0G0QwONEzqDSUJoV2TCz")
//          .collection("messages")
//          .orderBy("createdOn",descending: true)
//          .snapshots();
//    }
//   Future<List<Message>> getAllMessagess() async {
//     //returns all therapist from firestore collection
//     List<Message> doc = [];
//     //     builder: (context) => const Center(child: CircularProgressIndicator()));
//
//
//     try {
//       FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;
//
//       await mFirebaseFirestore.collection('chats')
//           .doc("0G0QwONEzqDSUJoV2TCz")
//           .collection("messages")
//           .orderBy("createdOn",descending: true)
//           .get()
//           .then((snapshot) {
//         snapshot.docs.forEach((element) {
//           Message message = Message.fromJson(
//               Map<String, dynamic>.from(element.data()));
//           doc.add(message);
//         });
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     // navigatorKey.currentState!.popUntil((route)=>route.);
//     // print(doc['nin']);
//     return doc;
//   }
// }