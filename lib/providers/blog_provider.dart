import 'package:flutter/cupertino.dart';
import 'package:miked_care/services/blog_service.dart';

import '../features/blogs/models/blog.dart';

class BlogProvider extends ChangeNotifier {
 late BlogService _blogService;
   List<Blog> blogs = [];

  BlogProvider(){
     _blogService = BlogService();
     getAllBlogs();
  }

  Future<void> getAllBlogs() async {
    blogs = await _blogService.getAllBlogs();
    notifyListeners();
  }
}