import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

import '../../../../providers/appointment_provider.dart';
import '../../../../providers/user_provider.dart';
import '../../appointment/models/appointment.dart';
import '../../dashboard/views/pages/dashboard_page.dart';
import '../models/therapist.dart';





class Reschedule extends StatefulWidget {
  const Reschedule({Key? key,  this.therapist, required this.appointment}) : super(key: key);
  final Therapist? therapist;
  final Appointment appointment;
  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {


  late DateTime date;
  late TimeOfDay time;
  late String tTime;
  late String dDate;
  @override
  void initState() {
    super.initState();
    date =   DateTime.parse(widget.appointment.date!);
    time =  TimeOfDay.fromDateTime(DateFormat.jm().parse(widget.appointment.time!.trim()));
  }



  void resheduleAppointment(AppointmentProvider appointmentProvider) async {

    Object data = {'date':dDate.toString(),'time':tTime.toString(),'status':'pending'};

    try{
      await appointmentProvider.reshedule(widget.appointment,context,data);
      StatusAlert.show(
        context,
        duration: Duration(seconds: 3),
        backgroundColor:Color(0xFFB0E3E8),
        title: 'Successful',
        subtitle: 'Appointment Resheduled',
        configuration: IconConfiguration(icon: Icons.done,size: 20),
        maxWidth: 200,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPage()));

    }catch(e){
      print('e');
    }
  }



  @override
  Widget build(BuildContext context) {

    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    widget.appointment.userId = userProvider.user.uid;




    return SafeArea(
      child:
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back_ios_outlined,)),
          title: Text('Reshedule Appointment'),
          actions: [

          ],
        ),
        body:
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20),


            child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: <Widget>[
                          Text("Reset the date and time for appointment",style:TextStyle(fontWeight: FontWeight.w600,fontSize:17 ),),

                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children:[
                              Icon(CupertinoIcons.calendar),
                              Text(" Date",style:TextStyle(fontWeight: FontWeight.w600,fontSize:15 ),)
                            ],
                            ),),

                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                color: Colors.grey,
                                onPressed: () {
                                  _showDatePicker();

                                },
                              ),
                              Text("${date.day} / ${date.month} / ${date.year}")
                            ],
                          ),
                          Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children:[
                              Icon(CupertinoIcons.time),
                              Text(" Time",style:TextStyle(fontWeight: FontWeight.w600,fontSize:15 ),)
                            ] ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                color: Colors.grey,
                                onPressed: () {
                                  _showTimePicker();

                                },
                              ),
                              Text("${time.format(context).toString()}")
                            ],
                          ),
                          Divider(
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),


                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                minimumSize: Size.fromHeight(
                                    45), // fromHeight use double.infinity as width and 40 is the height
                              ),
                              onPressed: () {
                                    resheduleAppointment(appointmentProvider);


                              },
                              child:  Text(
                                'Reshedule',
                                style: TextStyle(color: Colors.white),
                              )),

                        ],
                      ),
                    ),
              ),

      ),
    ));


    // );
  }

  _showDatePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.parse(widget.appointment.date!),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025)
    ).then((value) =>
        setState((){
          date  = value!  ;
          dDate = value!.toString();

        }
        ));
  }
  _showTimePicker(){
    showTimePicker(context: context, initialTime: time).then((value) =>
        setState((){
          time  = value! ;
          date = DateTime(value!.hour,value!.minute);
          String min;
          String hr;
          if(value!.hour < 10){
            hr = '0${value!.hour}';
          }else{
            hr = value!.hour.toString();
          }
          if(value!.minute < 10 ) {
            min = '0${value!.minute}';
          }
          else{
            min = value!.minute.toString();
          }
          tTime = "${hr} : ${min} ${time.period.toString().split('.')[1].toUpperCase()}" ;
        }
        ));

  }
//   showAlertDialog(BuildContext context,appointmentProvider) {
//
//     DateTime date = DateTime.parse(appointment.date!);
//     // var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", 'en');
//
//     // DateTime tempDate =Intl.withLocale('en', () => new DateFormat("yyyy-MM-dd hh:mm").parse(appointment.date!));
//     // var formattedDate = DateFormat('EEEE, MMM d, yyyy').format(date);
//
//     // DateFormat('MMMM d, y', 'en_US').parse(appointment.date!);
//     // set up the button
//     Widget okButton = TextButton(
//       child: Text("OK"),
//       onPressed: () {
//         resheduleAppointment(date,time);
//       },
//     );
//     Widget cancelButton = TextButton(
//       child: Text("CANCEL"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Review Appointment"),
//       content: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//
//
//
//
//           Text('Date & Time :'),
//           SizedBox(height: 5,),
//
//           Text('${date.day} / ${date.month}/ ${date.year}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600)),
//           SizedBox(height: 5,),
//
//           Text('${appointment.time}',style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600)),
//
//           SizedBox(height: 20,),
//           Text('Washing Bay :'),
//           SizedBox(height: 5,),
//
//           Text('${widget.place?.name}',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600)),
//           SizedBox(height: 5,),
//           Text('${widget.place?.address}',style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600)),
//
//
//
//
//
//
//           SizedBox(height: 20,),
//
//           Text('Car Selected :'),
//           SizedBox(height: 5,),
//
//           Text('${kind[selectedRadioTile-1]}',style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600)),
//           SizedBox(height: 20,),
//
//           Text('Pick Up Address :'),
//           SizedBox(height: 5,),
//
//           Text('${'_'}',style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600)),
//           SizedBox(height: 20,),
//
//           Text('Delivery Address :'),
//           SizedBox(height: 5,),
//
//           Text('${'_'}',style: TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w600)),
//           SizedBox(height: 20,),
//
//           Text('Total Cost :'),
//           SizedBox(height: 5,),
//
//           Text('${appointment.amount}',style: TextStyle(fontSize: 20,color:Palette.primaryDartfri,fontWeight: FontWeight.w600))
//
//
//         ],
//       ),
//       actions: [
//
//         cancelButton,
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
 }
