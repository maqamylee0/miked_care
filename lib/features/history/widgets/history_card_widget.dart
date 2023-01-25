import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/history/pages/message_detail.dart';
import 'package:provider/provider.dart';

import '../../../providers/message_provider.dart';
import '../../../providers/user_provider.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard(  {Key? key,required this.chatMessage }) : super(key: key);
 final  Map<String, dynamic>chatMessage;
  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {

  @override
  Widget build(BuildContext context) {
    // print("hiii ${widget.chatMessage['therapistName']}chatMessage");
    CollectionReference chats = FirebaseFirestore.instance.collection('chats');

    final messageProvider = Provider.of<MessageProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    var totalWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        await chats.where("users" , isEqualTo: { '${userProvider.user.uid}': null,'${widget.chatMessage['therapistUid']}':null })
            .limit(1)
            .get()
            .then(
                (QuerySnapshot querysnapshot) {
              if(querysnapshot.docs.isNotEmpty ){
                // print("hiiiiiiii "+querysnapshot.docs.single.id);

                messageProvider.setchatDocId(querysnapshot.docs.single.id);
              }else{
                print("id1:${userProvider.user.uid} id2:${widget.chatMessage['therapistUid']}");
              }

            }

        );
        Navigator.push(context,
            MaterialPageRoute(builder:
        (context)=>MessageDetailPage(therapistUid: widget.chatMessage['therapistUid'])));
             },
      child: Container(
        child:
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/personimage/emily.jpg"), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100)
                      ),
                      height: 60,
                      width: 60,

                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(4,4,4,4),
                                    child: Text("${widget.chatMessage['therapistName']}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                  ),


                              SizedBox(width: 5,),

                                  Text('${widget.chatMessage['createdOn']}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17))


                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("${widget.chatMessage['text']}"),


                              SizedBox(width: 10,),

                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                    child: Text('2',style: TextStyle(fontWeight: FontWeight.w600),),
                                      decoration: BoxDecoration(
                                        color: Colors.cyanAccent,
                                          borderRadius: BorderRadius.circular(100)
                                      )),



                                ],
                              )
                            ],
                          ),
                    )
                      ],
                    ),
                Divider(
                  color: Colors.grey,
                  endIndent: 10,
                  indent: 10
                  ,
                )
              ],
            )
      ),
    );


  }
}
