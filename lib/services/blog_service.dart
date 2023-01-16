import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:miked_care/services/auth.dart';

import '../features/auth/models/user.dart';
import '../features/blogs/models/blog.dart';

class BlogService{
  Future<List<Blog>> getAllBlogs() async {
    //returns all therapist from firestore collection
    List<Blog> doc = [];
    try {
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('blogs')
          .get()
          .then((snapshot) {
        snapshot.docs.forEach((element) {
          Blog therapist = Blog.fromJson(
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

  addToFav(String? uid) async {
    User? user = FirebaseAuth.instance.currentUser;
    Auth auth = Auth();
    Users userDetails = await auth.getUserDetails();
    List? favs = [];
    userDetails.fav_blogsIds?.forEach((element) {
      favs.add(element);
    });
    favs.add(uid);
    Map<String,dynamic> fav ={
      'fav_blogsIds': favs
    };
    try{
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('users')
          .doc(user?.uid)
          .update(fav)
          .then((snapshot)  async {
        // doc =  Users.fromJson(snapshot.docs[0].data()) ;
      });

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route)=>route.);
    // print(doc['nin']);
  }
  removeFromFav(String? uid) async {
    User? user = FirebaseAuth.instance.currentUser;
    Auth auth = Auth();
    Users userDetails = await auth.getUserDetails();
    List? favs = [];
    userDetails.fav_blogsIds?.forEach((element) {
      if(element == uid){

      }else{
        favs.add(element);
      }
    });
    Map<String,dynamic> fav ={
      'fav_blogsIds': favs
    };
    try{
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('users')
          .doc(user?.uid)
          .update(fav)
          .then((snapshot)  async {
        // doc =  Users.fromJson(snapshot.docs[0].data()) ;
      });

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route)=>route.);
    // print(doc['nin']);
  }

  }
