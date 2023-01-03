import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import '../widgets/faq_expansion.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final List<Stepe> _steps = getSteps();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:  Container(
            child: FooterView(
              children:<Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(


                        child: IconButton(onPressed:(){
                          Navigator.of(context).pop();
                        }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: Image.asset("assets/logo_black.png",
                              height: 200, width: 300),

                          //Image.asset("assets/img.png")
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("The FAQs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.cyanAccent),),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("Everything you need to know about MikedCares",style: TextStyle(
                                // height:1.5,fontSize: 20
                              ),)

                        ),
                      ),

                      // Expanded(
                      //   child:
                        Container(
                          height: MediaQuery.of(context).size.height!*0.5,
                          // padding: EdgeInsets.all(6),
                          child: ListView.builder(

                              physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount:_steps.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context,index){

                                return ExpansionWidget(step:_steps[index]);
                              }),
                        ),
                     // ),                    ],
                  ]),

                )],
              footer: Footer(

                child: Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("2021 - 2022 MIKEDCAREs® Inc."),
                        ],
                      ),
                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Text(" All Rights Reserved."),
                          SizedBox(width: 10,),

                          Row(
                            children: [
                              TextButton(onPressed: (){}, child: Text("Privacy Policy",style: TextStyle(fontSize: 12),)),
                              SizedBox(width: 5,),
                              TextButton(onPressed: (){}, child: Text("Terms",style: TextStyle(fontSize: 12)))
                            ],
                          )

                        ],
                      )
                    ],
                  ),

                ),
              ),
              flex: 10, //default flex is 2
            ),
          ),
        )
    );
  }
}
class Stepe {
  Stepe(
      this.title,
      this.body,
      [this.isExpanded = false]
      );
  String title;
  String body;
  bool isExpanded;
}

List<Stepe> getSteps() {
  return [
    Stepe('How does it works?', 'You will be matched with a professional therapist where you can have live sessions through calls, message and videos. You will be notified of how many sessions your plan can access with a monthly subscription rate.'),
    Stepe('How long does a session takes?', 'Open your terminal, run `flutter create <project_name>` to create a new project.'),
    Stepe('How much will it cost?', 'Change your terminal directory to the project directory, enter `flutter run`.'),
    Stepe('How do I make payment?', 'Change your terminal directory to the project directory, enter `flutter run`.'),
    Stepe('can I book for more than one therapy session?', 'Change your terminal directory to the project directory, enter `flutter run`.'),
    Stepe('What if i cant afford the fee?', 'Change your terminal directory to the project directory, enter `flutter run`.'),

  ];
}

