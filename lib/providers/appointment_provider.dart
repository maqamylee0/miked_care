import 'package:flutter/cupertino.dart';
import 'package:miked_care/features/appointment/pages/appoinment_page.dart';
import 'package:miked_care/features/auth/models/user.dart';
import 'package:miked_care/services/auth.dart';
import 'package:miked_care/services/therapist_service.dart';

import '../features/appointment/models/review.dart';
import '../features/appointment/models/therapist.dart';

class AppointmentProvider extends ChangeNotifier{
  List<Therapist> therapists = [];
   List<Review> reviews = [] ;
  // late List<dynamic> reviewIds;
  late String? message ='' ;
  late UserModel user;
  String username ='';
  var _therapistService;

  AppointmentProvider(){
    _therapistService = TherapistService();
    getAllTherapists();
  }

  // Future<void> setreviewid(List <dynamic> reviewIdss) async {
  //   reviewIds = reviewIdss;
  //   // await getTherapistReviews(reviewIds);
  //   notifyListeners();
  //
  // }

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
  notifyListeners();
  }


}