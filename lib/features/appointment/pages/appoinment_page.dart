import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miked_care/features/appointment/widgets/appointment_card.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}


class _AppointmentPageState extends State<AppointmentPage>with TickerProviderStateMixin {
  List<Text> tabChildren = [
    Text("hi1"),
    Text("hi2"),
    Text("hi3"),
  ];
  late TabController tabController;
  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Text("Appointment", style:TextStyle(fontWeight: FontWeight.w600,fontSize: 40,),),
              SizedBox(height: 20,),
              Container(
                child: TabBar(
                  controller: tabController,
                    labelColor: Colors.cyanAccent,
                    unselectedLabelColor: Colors.black,
                    indicatorColor:Colors.cyanAccent ,
                    tabs:[
                      Tab(text: "Upcoming",),
                      Tab(text: "Finished",),
                      Tab(text: "Cancelled",),
                    ]

                    ),
              ),
               Expanded(
                  // width: double.maxFinite,
                   child:TabBarView(
                  controller: tabController,
                    children:  [
                    Container(
                      // padding: EdgeInsets.all(6),
                      child: ListView.builder(

                          physics: NeverScrollableScrollPhysics(),
                          // shrinkWrap: true,
                          itemCount:3,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){

                            return AppointmentCard();
                          }),
                    ),
                      Container(
                        // padding: EdgeInsets.all(6),
                        child: ListView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            itemCount:3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){

                              return AppointmentCard();
                            }),
                      ),
                      Container(
                        // padding: EdgeInsets.all(6),
                        child: ListView.builder(

                            physics: NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            itemCount:3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){

                              return AppointmentCard();
                            }),
                      ),
                    ])),


            ],
          ),
        ),
      ),
    );
  }
}