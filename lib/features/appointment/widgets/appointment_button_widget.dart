import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/models/appointment.dart';
import 'package:provider/provider.dart';
import 'package:status_alert/status_alert.dart';

import '../../../providers/appointment_provider.dart';
import '../pages/reschedule.dart';

class Appointment_button extends StatelessWidget {
  const Appointment_button({
    Key? key,  required this.title, required this.appointment,
  }) : super(key: key);
  final String title;
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return ElevatedButton(

      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(120, 35)),
        padding:  MaterialStateProperty.all(EdgeInsets.fromLTRB(12, 5, 12, 5)),                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

        shape: MaterialStateProperty.all<RoundedRectangleBorder>(

          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),

          ),

        ),
        side: MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
          {
            return const BorderSide(color: Colors.grey);
          }
          return null; // Defer to default value on the theme or widget.
        }),
        // shadowColor:MaterialStateProperty.all<Color>(Color.fromRGBO(8, 143, 129, 0.4)) ,
        // elevation: MaterialStateProperty.all<double>(20),
      ),
      onPressed: () {
        if(title == 'Reschedule'){
          resheduleAppointment(appointment,context,appointmentProvider);
        }else if (title == 'Cancel Appointment'){
          print('yyyyyyyyyyyyyyyy${appointment.userId}');
          cancelAppointment(appointment,context,appointmentProvider);
        }else{
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(appointment:appointment)));
        }
      },
      child: Text('$title',style: TextStyle(color: Colors.grey, fontSize: 14),),

    );
  }

  void cancelAppointment(Appointment appointment,context, AppointmentProvider appointmentProvider) {
    showAlertDialog(context,appointmentProvider);

  }
  showAlertDialog(BuildContext context, AppointmentProvider appointmentProvider) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () async {
        await appointmentProvider.cancelAppointment(appointment,context);
        StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          backgroundColor:Color(0xFFB0E3E8),
          title: 'Successful',
          subtitle: 'Appointment Cancelled',
          configuration: IconConfiguration(icon: Icons.done,size: 20),
          maxWidth: 200,
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cancel Appointment"),
      content: Text("Would you like to continue to cancel Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void resheduleAppointment( appointment,context,appointmentProvider) {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>Reschedule(appointment:appointment)));
  }
}
