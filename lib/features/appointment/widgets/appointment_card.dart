import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/appointment_provider.dart';
import '../models/appointment.dart';
import 'appointment_button_widget.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({Key? key, required this.appointment,}) : super(key: key);
  final Appointment appointment;
  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    var totalWidth = MediaQuery.of(context).size.width;
    var datetime = DateTime.parse(widget.appointment.date!);

    return Container(
      padding: EdgeInsets.all(5),
      width: totalWidth*0.6,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/emily.jpg"), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 120,
                width: 115,

              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${widget.appointment.therapist}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('${widget.appointment.status}',style: TextStyle(color: Colors.grey),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.calendar_month_rounded),
                          Text("${datetime.year}/${datetime.month}/${datetime.day}")
                        ],
                      ),

                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Icon(Icons.timer),
                          Text('${widget.appointment.time}')

                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 5,),
          Container(
            // width: totalWidth * 0.6,
            child: Row(

              children: [

                Appointment_button(title:"Reschedule"),
                SizedBox(width: 10,),
                Appointment_button(title:"Cancel Appointment"),

              ],
            ),
          )
        ],
      ),

    );
  }
}


