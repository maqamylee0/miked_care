
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../features/appointment/models/review.dart';
import '../features/appointment/models/therapist.dart';
import '../features/auth/models/user.dart';

class TherapistService {
  Future<List<Therapist>> getAllTherapists() async {
    //returns all therapist from firestore collection
    List<Therapist> doc = [];
    //     builder: (context) => const Center(child: CircularProgressIndicator()));


    try {
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('therapist')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Therapist therapist = Therapist.fromJson(
              Map<String, dynamic>.from(element.data()));
          doc.add(therapist);
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route)=>route.);
    // print(doc['nin']);
    return doc;
  }


  Future<List<Review>> getTherapistReviews(List<dynamic> reviewIds) async {
    //returns review of a therapist
    List<Review> doc = [];
    try {
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('reviews')
          .where('reviewId', whereIn: reviewIds)
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Review reviews = Review.fromJson(
              Map<String, dynamic>.from(element.data()));
          doc.add(reviews);
        });
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route)=>route.);

    return doc;
  }

  Future<UserModel> getUserDetails(String uid) async {
    late UserModel doc;
    try {
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((snapshot) {
        doc = UserModel.fromMap(snapshot.docs[0]);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    print(doc.name);
    return doc;
  }
}