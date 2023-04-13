import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/features/appointment/models/appointment.dart';

import '../features/dashboard/views/pages/dashboard_page.dart';

class AppointmentService{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late String appointmentId;
  // List appointments = [];

  // Future<String>  makeAppointment(appointment) async {
  //    try{
  //      await firebaseFirestore
  //          .collection("appointment")
  //          .add(appointment.toJson()).then(
  //              (value) => appointmentId = value.id )
  //      .catchError((e){
  //        Fluttertoast.showToast(msg: e!.message);
  //
  //      });
  //    }catch(e){
  //      Fluttertoast.showToast(msg: "Failed to make appointment");
  //
  //    }
  //     return appointmentId;
  //   // Fluttertoast.showToast(msg: "Account created successfully :) ");
  //
  // }
  Future<String>  makeAppointment(appointment,context) async {
    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      await firebaseFirestore
          .collection("appointment")
          .add(appointment.toJson()).then(
              (value) => appointmentId = value.id )
          .catchError((e){
        BotToast.showText(text: e!.message);


      });
      postAppointment(context,appointment,appointmentId);


    }catch(e){
      BotToast.showText(text:"Failed to make appointment");

    }
    return appointmentId;
    // Fluttertoast.showToast(msg: "Account created successfully :) ");

  }
  Future<void> postAppointment(context,appointment, String appointmentId) async {

    try{
      await firebaseFirestore
          .collection("appointment")
          .doc(appointmentId)
          .update({'appointmentId':appointmentId})
      .catchError((e)=>print(e));
      Navigator.pushNamed(context, 'make_payment',);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    };
  }


  Future<void>  makePayment(payment,context) async {
    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      await firebaseFirestore
          .collection("payment")
          .add(payment.toJson())
          .catchError((e){
        Fluttertoast.showToast(msg: e!.message);


      });
      Fluttertoast.showToast(msg: "Payment made successfully :) ");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
    }catch(e){
      Fluttertoast.showToast(msg: "Failed to make payment");
    }

  }

  Future<List<Appointment>>  getAppointments(userId) async {
    List<Appointment>  appointments= [];
    try{
      await firebaseFirestore
          .collection("appointment").where("userId" ,isEqualTo: userId )
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((doc) {
          Appointment appointment = Appointment.fromJson(
              Map<String, dynamic>.from(doc.data()));
              appointments.add(appointment);

        });
      })
          .catchError((e){
        Fluttertoast.showToast(msg: e!.message);

      });
    }catch(e){
      Fluttertoast.showToast(msg: "Failed to get appointments");
    }
    return appointments;
  }

  Future<void>  cancelAppointment(Appointment appointment,context) async {
    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      print('rrrrrrrrrrrrrrrrrrrrrr${appointment.appointmentId}');
      await firebaseFirestore
          .collection("appointment")
          .doc(appointment.appointmentId)
          .update({ 'status' : "cancelled"});
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));


    } catch (e) {
      if (kDebugMode) {

        print(e);
        // Fluttertoast.showToast(msg:"Failed to cancel appointment" );
        BotToast.showText(text:"Failed to cancel appointment");
        Navigator.pop(context);

      }
    };
  }
  Future<void>  reshedule(Appointment appointment,context,data) async {
    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      print('tttttttttttttttttt${appointment.appointmentId}');
      await firebaseFirestore
          .collection("appointment")
          .doc(appointment.appointmentId)
          .update(data)
      .catchError((e)=>print(e));
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));


    } catch (e) {
      if (kDebugMode) {
        Navigator.pop(context);

        print(e);
        BotToast.showText(text:"Failed to reshedule appointment");

      }
    };
  }

}