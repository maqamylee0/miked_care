import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appointment_button_widget.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({Key? key}) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("personimage/emily.jpg"), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 120,
                width: 115,

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Dr.Edidiong Ishola'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('confirmed',style: TextStyle(color: Colors.grey),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.calendar_month_rounded),
                          Text("12/02/2022")
                        ],
                      ),

                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Icon(Icons.timer),
                          Text('08:00 pm')

                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [

              Appointment_button(title:"Reschedule"),
              SizedBox(width: 20,),
              Appointment_button(title:"Cancel Appointment"),

            ],
          )
        ],
      ),

    );
  }
}


