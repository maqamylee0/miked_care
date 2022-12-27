import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key}) : super(key: key);

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("personimage/emily.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    height: 80,
                    width: 80,

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                child: Text("Wendy Watson",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                              ),


                          SizedBox(width: 10,),

                              Text('07:30 pm',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17))


                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text("Thanks for your time"),


                          SizedBox(width: 20,),

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
                      )
                    ],
                  ),
              Divider(
                color: Colors.grey,
                endIndent: 20,
                indent: 20
                ,
              )
            ],
          )
    );


  }
}
