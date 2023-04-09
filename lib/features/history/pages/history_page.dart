import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../providers/message_provider.dart';
import '../widgets/history_card_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>with TickerProviderStateMixin  {

  late TabController tabController;
  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30,),
              Text("History", style:TextStyle(fontWeight: FontWeight.w600,fontSize: 30,),),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  //This is for background color
                    color: Colors.white.withOpacity(0.0),
                    //This is for bottom border that is needed
                    border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))),
                child: TabBar(
                    controller: tabController,
                    labelColor: Colors.cyanAccent,
                    unselectedLabelColor: Colors.black,
                    indicatorColor:Colors.cyanAccent ,
                    tabs:[
                      Tab(text: "Message",),
                      Tab(text: "Voice Call",),
                      Tab(text: "Video Call",),
                    ]

                ),
              ),
              Expanded(
                  // height: MediaQuery.of(context).size.height*0.6,
                  // width: double.maxFinite,
                  child:TabBarView(
                      controller: tabController,
                      children:  [
                        history_card(),
                        history_card(),
                        history_card(),

                      ])),


            ],
          ),
        ),
      ),
    );
  }
}

class history_card extends StatelessWidget {
   history_card({
    Key? key,
  }) : super(key: key);
  Map sorted={};

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    for(Map m in messageProvider.chats){
      if(sorted[m['senderId'].toString()]==null)
        sorted[m['senderId'].toString()]=[];

      sorted[m['senderId'].toString()].add(m);

    }
    return Container(
      // padding: EdgeInsets.all(6),
      child:

      ListView(
        shrinkWrap:true,
        children: sorted.entries.map<Widget>((value){
          return HistoryCard(chatMessage: value);
        }).toList(),
      )
     ,
      // ListView.builder(
      //
      //     physics: ScrollPhysics(),
      //     // shrinkWrap: true,
      //     itemCount:sorted.entries.length,
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context,index){
      //      // print("index ${messageProvider.chats.length}");
      //       return HistoryCard( chatMessage :sorted.entries.);
      //     }),
    );
  }
}