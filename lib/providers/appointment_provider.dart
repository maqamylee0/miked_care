
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:miked_care/features/appointment/pages/appoinment_page.dart';
import 'package:miked_care/features/auth/models/user.dart';
import 'package:miked_care/providers/user_provider.dart';
import 'package:miked_care/services/auth.dart';
import 'package:miked_care/services/therapist_service.dart';

import '../features/appointment/models/appointment.dart';
import '../features/appointment/models/review.dart';
import '../features/appointment/models/therapist.dart';
import '../services/appointment_service.dart';

class AppointmentProvider extends ChangeNotifier{
  List<Therapist> therapists = [];
   List<Review> reviews = [] ;
  // late List<dynamic> reviewIds;
  late String? message ='' ;
  late Users user;
  String username ='';
  var _therapistService;
  var _appointmentService = AppointmentService();
  UserProvider userProvider = UserProvider();
  late String appointmentId ;
  List appointments = [];
  List done_appointments=[];
  List caancelled_appointments=[];
  List pending_appointments=[];

  AppointmentProvider(){
    _therapistService = TherapistService();
    _appointmentService = AppointmentService();

    getAllTherapists();
    getAppointments();
  }

  // Future<void> setreviewid(List <dynamic> reviewIdss) async {
  //   reviewIds = reviewIdss;
  //   // await getTherapistReviews(reviewIds);
  //   notifyListeners();
  //
  // }

  String getAppointmentId(){
    return appointmentId;
  }
  void setReview(List review){
    reviews = reviews;
    notifyListeners();
  }
  void setMessage(String message){
    message = message;
    notifyListeners();
  }
  void setUsername(String username){
    username = username;
    notifyListeners();
  }

  Future<void> getAllTherapists() async {
    therapists = await _therapistService.getAllTherapists();
    notifyListeners();
  }
  Future<void> getTherapistReviews(List<dynamic> reviewIds) async {
    reviews = await _therapistService.getTherapistReviews(reviewIds);

    // notifyListeners();
    message =  reviews[0].message;
    await getUser(reviews[0].userId);
    notifyListeners();
  }
  Future<void> getUser(String? uid) async {
  user = await _therapistService.getUserDetails(uid);
  username = user.name!;
  // print('uuuuuuuuuuuuuuuuuuuuuuuuuuu ${user.uid}');

  // await getAppointments(user.uid);
  notifyListeners();
  }
  // Future<Users> getUserId() async {
  //  return await user;
  // }
  Future<void> makeAppointment(appointment,context) async {
    appointmentId = await _appointmentService.makeAppointment(appointment,context);
    // username = user.name!;
    await getAppointments();
    notifyListeners();
  }
  Future<void> makePayment(payment,context) async {
     await _appointmentService.makePayment(payment,context);
    // username = user.name!;
      getAppointments();

     notifyListeners();
  }
  // List getAppointmentss()=> appointments;

 Future<List> getAppointments() async {

   appointments = [];
   caancelled_appointments = [];
   done_appointments = [];
   pending_appointments = [];
   appointments = await _appointmentService.getAppointments(FirebaseAuth.instance.currentUser?.uid);
   appointments.forEach((element){
     if (element.status =='done' ){
       done_appointments.add(element);
     }else if(element.status == 'cancelled'){
       caancelled_appointments.add(element);
     }else {
       pending_appointments.add(element);
     }

   });
   // username = user.name!;
   notifyListeners();
   // print('apppppppppppppppppppppppp ${appointments.length}');
   return appointments;
  }
  Future<void> cancelAppointment(Appointment appointment,context) async {

    await _appointmentService.cancelAppointment(appointment,context);
    // username = user.name!;
    await getAppointments();

    notifyListeners();
  }
  // Future<void> makePayment(payment) async {
  //   await _appointmentService.makePayment(payment);
  //   // username = user.name!;
  //   getAppointments();
  //   notifyListeners();
  // }
  Future<void> reshedule(appointment,context,data) async {
    await _appointmentService.reshedule(appointment,context,data);
    // username = user.name!;
    getAppointments();
    notifyListeners();
  }
}