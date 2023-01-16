import 'package:flutter/cupertino.dart';
import 'package:miked_care/services/blog_service.dart';

import '../features/auth/models/user.dart';
import '../features/blogs/models/blog.dart';
import '../services/auth.dart';

class BlogProvider extends ChangeNotifier {
 late BlogService _blogService;
 late Auth _auth;
   List<Blog> blogs = [];
   List<String> fav = [];

  BlogProvider(){
     _blogService = BlogService();
     _auth = Auth();
     getAllBlogs();
     getUserDetails();
  }

  Future<void> getAllBlogs() async {
    blogs = await _blogService.getAllBlogs();
    notifyListeners();
  }

 Future<void> addToFav(Blog blog) async {
    await _blogService.addToFav(blog.uid);
   await getUserDetails();
   notifyListeners();
 }
  Future<void> removeFromFav(Blog blog) async {
      await _blogService.removeFromFav(blog.uid);
      await getUserDetails();
    notifyListeners();
  }


  Future<void> getUserDetails() async {
    Users user = await _auth.getUserDetails();
    List<String> favs = [];
    user.fav_blogsIds?.forEach((element) {
       favs.add(element);
    });
    fav = favs;
    notifyListeners();
  }
}
