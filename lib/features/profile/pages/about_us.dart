import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
      Text("About Us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.cyanAccent),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.center,
            child: Text("MIKEDCAREs is a social enterprise that provides perinatal mental health support services for women of childbearing ages, parents and child caregivers, helping them informed decisions that promote their mental health and well being while also raising children that will make a better society",style: TextStyle(
                height:1.5,fontSize: 20),)

        ),
      ),
      SizedBox(height: 20,),
      Text("Contact Us",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.cyanAccent),),
      SizedBox(height: 10,),
      Text("+2347065233467",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,),),
      SizedBox(height: 10,),
      Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/linkdin.svg',
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          SizedBox(width: 5,),
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/fb.svg',
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          SizedBox(width: 5,),

          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              'assets/icons/twit.svg',
              height: 40.0,
              width: 40.0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
                  ],
                ),
                ],
              ),

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
                          SizedBox(width: 20,),

                          Row(
                            children: [
                              TextButton(onPressed: (){}, child: Text("Privacy Policy")),
                              SizedBox(width: 20,),
                              TextButton(onPressed: (){}, child: Text("Terms"))
                            ],
                          )

                        ],
                      )
                    ],
                  ),

              ),
            ),
            flex: 3, //default flex is 2
          ),
        ),
      )
    );
  }}







                    // SizedBox(height: 30,),






