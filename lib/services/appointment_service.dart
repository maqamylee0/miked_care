import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:miked_care/features/appointment/models/appointment.dart';

class AppointmentService{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late String appointmentId;
  // List appointments = [];

  Future<String>  makeAppointment(appointment) async {
     try{
       await firebaseFirestore
           .collection("appointment")
           .add(appointment.toJson()).then(
               (value) => appointmentId = value.id )
       .catchError((e){
         Fluttertoast.showToast(msg: e!.message);

       });
     }catch(e){
       Fluttertoast.showToast(msg: "Failed to make appointment");

     }
      return appointmentId;
    // Fluttertoast.showToast(msg: "Account created successfully :) ");

  }
  Future<void>  makePayment(payment) async {
    try{
      await firebaseFirestore
          .collection("payment")
          .add(payment.toJson())
          .catchError((e){
        Fluttertoast.showToast(msg: e!.message);
        Fluttertoast.showToast(msg: "Payment made successfully :) ");

      });
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
}