import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/history/pages/message_detail.dart';
import 'package:provider/provider.dart';

import '../../../providers/message_provider.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard(  {Key? key,required this.chatMessage }) : super(key: key);
 final chatMessage;
  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {

  @override
  Widget build(BuildContext context) {

    var totalWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MessageDetailPage())

        );      },
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
                                    child: Text("me",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                  ),


                              SizedBox(width: 5,),

                                  Text('07:30 pm',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17))


                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("Thanks for your time"),


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
