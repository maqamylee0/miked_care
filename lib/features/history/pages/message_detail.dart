import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miked_care/features/history/pages/video_call.dart';
import 'package:provider/provider.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

import '../../../providers/message_provider.dart';
import '../../../providers/user_provider.dart';
import '../models/message.dart';

class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({Key? key,  required this.therapistUid, }) : super(key: key);
  final String? therapistUid;
  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');

  // String chatDocId = "0G0QwONEzqDSUJoV2TCz";
  TextEditingController textController = TextEditingController();
  String therapistName = "Edidiong";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final messageProvider = Provider.of<MessageProvider>(context);

    return Scaffold(
      body:( messageProvider.chatDocId == "") ?  Center(
        child: Text("Loading Chat"),
      ):
      StreamBuilder<QuerySnapshot>(
        stream: chats
            .doc(messageProvider.chatDocId)
            .collection("messages")
            .orderBy("createdOn", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading"),
            );
          }
          if (snapshot.hasData) {
            var data;

            return CupertinoPageScaffold(

                navigationBar: CupertinoNavigationBar(
                  // backgroundColor: Colors.red,

                  previousPageTitle: "back",
                  middle: Text("Edidiong"),

                  trailing:
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoSDKQuickStart()));
                            }, icon:  Icon(CupertinoIcons.phone))

                          ],

                      ),
                    ),




                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Expanded(
                          child: ListView(
                          reverse: true,
                          children: snapshot.data?.docs.map<Widget>(
                                (DocumentSnapshot document) {
                              data = document.data()!;
                              // print(document.toString());
                              if (kDebugMode) {
                                print(data);
                              }
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),


                                  child: ChatBubble(
                                    clipper: ChatBubbleClipper6(
                                      nipSize: 0,
                                      radius: 20,
                                      type: isSender(data['senderId'].toString(),userProvider.user.uid)
                                          ? BubbleType.sendBubble
                                          : BubbleType.receiverBubble,
                                    ),
                                    alignment: getAlignment(data['senderId'].toString(),userProvider.user.uid),
                                    margin: EdgeInsets.only(top: 20),
                                    backGroundColor: isSender(data['senderId'].toString(),userProvider.user.uid)
                                        ? Color(0xFF29D2D4)
                                        : Color(0xff9146d3),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                        MediaQuery.of(context).size.width * 0.7,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width * 0.7,
                                                padding : EdgeInsets.all(10),
                                                child: InkWell(
                                                  onLongPress: (){
                                                    var index = snapshot.data?.docs.indexOf(data);
                                                    print(index);
                                                    FlutterClipboard.copy(snapshot.data?.docs[index]['text']).then(( value ) {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text('Copied To Clipboard'),
                                                      )
                                                      );});
                                                  },

                                                  child: Text(data['text'],
                                                      textAlign: TextAlign.left
                                                      ,
                                                      style: TextStyle(
                                                          color: isSender(
                                                              data['senderId'].toString(),userProvider.user.uid)
                                                              ? Colors.white
                                                              : Colors.black),
                                                      maxLines: 100,
                                                      overflow: TextOverflow.ellipsis),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                data['createdOn'] == null
                                                    ? DateTime.now().toString()
                                                    : data['createdOn']
                                                    .toDate()
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: isSender(
                                                        data['senderId'].toString(),userProvider.user.uid)
                                                        ? Colors.white
                                                        : Colors.black),
                                              )
                                            ],
                                          )
                                        ],
                                      ),

                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onLongPress: (){
                                  FlutterClipboard.paste().then((value) {
                                    setState(() {
                                      textController.text = value;
                                    });
                                  });
                                },
                                child: CupertinoTextField(
                                  controller: textController,
                                ),
                              ),
                            ),
                            CupertinoButton(
                                child: Icon(Icons.send_sharp),
                                onPressed: () {
                                  sendMessage(textController.text,userProvider.user.uid,messageProvider.chatDocId, messageProvider);
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void sendMessage(String msg,userId,chatDocId, MessageProvider messageProvider) {
    if (msg == '') return;
        chats
        .doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'senderId': userId,
      'therapistName':therapistName,
      "therapistUid":widget.therapistUid,
      'text': msg
    }).then((value) {
      textController.text = '';
      messageProvider.getAllChats;
    });


  }
  bool isSender(String therapist,currentUserId) {
    return therapist == currentUserId;
  }

  Alignment getAlignment(therapist,currentUserId) {
    if (therapist == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

}
