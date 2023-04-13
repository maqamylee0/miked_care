import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miked_care/features/appointment/models/appointment.dart';
import 'package:miked_care/features/appointment/widgets/dashboard_button.dart';
import 'package:provider/provider.dart';

import '../../../providers/appointment_provider.dart';
import '../../../providers/user_provider.dart';
import '../models/therapist.dart';

class AppointmentFormPage extends StatefulWidget {
  const AppointmentFormPage({Key? key,  this.therapist}) : super(key: key);
  final Therapist? therapist;

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  late int selectedRadioTile;
  late int selectedRadio;
  late int selectedRadioTile2;
  late int selectedRadio2;
  Appointment appointment = Appointment();

  TimeOfDay time = TimeOfDay(hour: 8, minute: 00);
  DateTime date = DateTime(2023);

   List<String> kind = ['Individual','Couple','Family'];
   List<String> type = ['Flexible','Structure'];

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    selectedRadioTile = 1;
    selectedRadio2 = 1;
    selectedRadioTile2 = 1;
  }
  setSelectedRadioTile2(int val) {
    setState(() {
      selectedRadioTile2 = val;

    });
  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;

    });
  }

    makeAppointment(appointmentProvider){
     appointment.kind = kind[selectedRadioTile-1];
     appointment.type = type[selectedRadioTile2-1];
     // appointment.userId =
     appointment.status = 'pending';
     appointment.therapistId = widget.therapist?.therapistUid;
     appointment.therapist = widget.therapist?.name;


     try{
        appointmentProvider.makeAppointment(appointment,context);
        // print('hiiiiiiiiiiiiiiiii ${appointment.kind}');
        // print('hiiiiiiiiiiiiiiiii ${appointment.type}');
        // print('hiiiiiiiiiiiiiiiii ${appointment.date}');
        // print('hiiiiiiiiiiiiiiiii ${appointment.time}');


     }catch(e){
       print('e');
     }
  }


  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
      appointment.userId = userProvider.user.uid;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5,),
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
              Align(
                child: Text("Book appointment",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 20,
              ),

              Text("1. What kind of therapy would you like to have?",style:TextStyle(fontWeight: FontWeight.w600,fontSize:17 ),),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Individual"),
                        dense: true,

                        // subtitle: Text("Radio 1 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: true,
                      ),
                    ),

                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text("Couple"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,

                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        value: 3,
                        groupValue: selectedRadioTile,
                        title: Text("Family"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,
                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),

              Text("2. What kind of therapy would you like to have?",style:TextStyle(fontWeight: FontWeight.w600,fontSize:17 ),),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile2,
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Flexible"),
                        dense: true,

                        // subtitle: Text("Radio 1 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile2(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: true,
                      ),
                    ),

                    Expanded(
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedRadioTile2,
                        title: Text("Structure"),
                        contentPadding: EdgeInsets.all(0),
                        dense: true,

                        // subtitle: Text("Radio 2 Subtitle"),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile2(val!);
                        },
                        activeColor: Colors.cyanAccent,
                        // secondary: OutlineButton(
                        //   child: Text("Say Hi"),
                        //   onPressed: () {
                        //     print("Say Hello");
                        //   },
                        // ),
                        selected: false,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Text("3. Set the date and time you would like to have the therapy",style:TextStyle(fontWeight: FontWeight.w600,fontSize:17 ),),

              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Date",style:TextStyle(fontWeight: FontWeight.w600,fontSize:15 ),),
              ),

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
                child: Text(" Time",style:TextStyle(fontWeight: FontWeight.w600,fontSize:15 ),),
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
              SizedBox(height: 20,),
              SizedBox(
                height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(
                            55), // fromHeight use double.infinity as width and 40 is the height
                      ),
                      onPressed: () {
                        makeAppointment(appointmentProvider);
                      },
                      child:  Text(
                        'Continue',
                        style: TextStyle(color: Colors.white,fontSize: 24),
                      )))
                  // LargeButton(title: "Continue", callback: makeAppointment(appointmentProvider)))
            ],
          ),
        ),
      ),
    );
  }
  _showDatePicker(){
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025)
    ).then((value) =>
        setState((){
      date  = value!  ;
      appointment.date = value!.toString();

    }
    ));
  }
  _showTimePicker(){
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) =>
        setState((){
          time  = value! ;
          date = DateTime(value!.hour,value!.minute);
          String min;
          if(value!.minute < 10 ) {
          min = '0${value!.minute}';
          }
          else{
         min = value!.minute.toString();
          }
          appointment.time = "${value!.hour}:${min} ${time.period.toString().split('.')[1].toUpperCase()}" ;
        }
        ));

  }
}
