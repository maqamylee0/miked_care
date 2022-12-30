import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miked_care/features/appointment/widgets/book_appointment.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'widgets/icon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 30, 0),
          child: SingleChildScrollView(
            child:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Hello, Sarah",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Stack(
                      clipBehavior: Clip.none, children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: ClipOval(

                              child: Image.asset("personimage/emily.jpg",height: 200,width: 200,
                              ),
                            )
                        ),
                      ),
                      Positioned(
                          left: 50,
                          bottom: -20,
                          child: Icon(Icons.circle_notifications_rounded,color: Colors.grey,size: 40,))
                    ],
                    )

                  ],
                ),
                SizedBox(height: 20,),
                Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0x7CCCCCCB),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    height: 130,
                    width: MediaQuery.of(context).size.width*0.7,
                    child:  Card(


                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipOval(

                                      child: Image.asset("personimage/emily.jpg",height: 200,width: 200,
                                      ),
                                    )
                                ),
                              ),

                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                SizedBox(height: MediaQuery.of(context).size.width*0.01,),

                                Expanded(
                                    child:SizedBox(
                                        width:MediaQuery.of(context).size.width*0.2,
                                        child:const Text("You have been matched with Edidiong Ishola",
                                          style: TextStyle(fontWeight: FontWeight.bold,),
                                          textAlign: TextAlign.start,)
                                    )

                                ),

                                SizedBox(height: MediaQuery.of(context).size.width*0.01,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("Fee : #30,000",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(width: 20,),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                       context, MaterialPageRoute(builder: (context) => const BookAppointment()));



                                      },
                                      child: Text("View Profile",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.cyanAccent),),
                                    )
                                  ],
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("My Progress : 0 % complete",style: TextStyle(fontWeight: FontWeight.bold,
                  ),),),


                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width*0.35,
                    animation: true,
                    lineHeight: 13.0,

                    animationDuration: 2500,
                    percent: 0.8,
                    center: Text("80.0%"),
                    barRadius:Radius.circular(30) ,

                    progressColor: Colors.cyanAccent,
                    backgroundColor: Colors.grey,
                    // linearGradientBackgroundColor: LinearGradient(
                    //   colors: [
                    //     Colors.white,
                    //     Colors.white,
                    //   ],
                    // ),
                  ),

                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {  },
                      child: Text("Apply for Financial Aid",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 12),
                      ),
                    )
                ),
                // SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20
                  ),),),
                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height*0.34,
                  child:  GridView(

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (1 / .8),
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30),
                      children: const [
                        IconCard(pathToIcon:'/icons/postpartum.svg',title:'PostPartum'),
                        IconCard(pathToIcon:'/icons/pregsupport.svg',title:'Pregnancy Support'),
                        IconCard(pathToIcon:'/icons/preconception.svg',title:'Preconception'),
                        IconCard(pathToIcon:'/icons/checkin.svg',title:'Checkin'),
                      ]),
                )

              ],

            ),

          )




      ),
    );
  }
}
