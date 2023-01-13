import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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
}