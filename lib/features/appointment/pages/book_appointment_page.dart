import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/widgets/dashboard_button.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  @override
  Widget build(BuildContext context) {
    var totalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child:
      Container(
        width:totalWidth ,
        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              child: IconButton(onPressed:(){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
            ),
            Container(
              width: totalWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("personimage/emily.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    height: 110,
                    width: 115,

                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Dr. Edidiong Ishola",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Parental Therapist",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700)),
                  ),
                  Icon(Icons.comment,color: Colors.grey,size:25)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("About",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children:[
                    TextSpan(
                      style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.w700) ,
                      text: "Dr. Edidiong Ishola is one of the top perinatal therapist in Nigeria. she has won several recognition in this field and has helped women in thier perinatal journey."

                ),
                WidgetSpan(

                    child: SizedBox(
                      height: 15,
                      child: TextButton(

                  onPressed: () {  },
                  child: Text("View More",),
                ),
                    ))
                // 'Dr. Edidiong Ishola is one of the top perinatal '
                //     'therapist in Nigeria. she has won several recognition in this field and has helped women in thier perinatal journey.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
              ]))
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Working Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Monday - Saturday 08:00am - 08:00pm ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Reviews",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                      SizedBox(width: 5,),
                      Icon(Icons.star_half,size: 22,),
                      SizedBox(width: 5,),
                      Text("5.0(94 reviews)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))
                    ],
                  ),
                  TextButton(onPressed: (){

                  }, child: Text("see all",))
                ],
              ),
            ),
            Row(

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: totalWidth*0.38,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("personimage/emily.jpg"), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              height: 80,
                              width: 80,

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 10, 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_half,size: 22,),
                                SizedBox(width: 5,),
                                Text("4")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Taylor Swift",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: totalWidth*0.34,
                        child: Text("Dr. Edidiong is very professional in her work and responsive."
                            " I really enjoyed my session with her",style: TextStyle(fontSize: 14,)),
                      ),
                    ),


                  ],
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LargeButton(title:"Book appointment"),
            )
          ],
        ),
      ),

      ),
    );
  }
}
