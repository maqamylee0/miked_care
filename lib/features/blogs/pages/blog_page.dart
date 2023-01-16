import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/blogs/models/blog.dart';
import 'package:provider/provider.dart';

import '../../../providers/blog_provider.dart';
import '../../../providers/user_provider.dart';
import '../widgets/blog_item.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final blogs = Provider.of<BlogProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: Image.asset("assets/logo_black.png",
                      height: 200, width: 300),

                  //Image.asset("assets/img.png")
                ),
              ),
              Text("Blogs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Icons.search),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                                SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    onChanged:(value) {
                                      blogs.setSearch();
                                      blogs.runFilter(value);
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _searchController,
                                  decoration: InputDecoration.collapsed(

                                     hintText: 'Search', ),
                    ),
                                ),
                    // IconButton(
                    //   iconSize: 20,
                    //   icon: Icon(Icons.settings),
                    //   color: Colors.black,
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              (blogs.newBlogs.isEmpty) ?
              Text("No Results Found",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold))
              :Expanded(
                child: Container(
                  // padding: EdgeInsets.all(6),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: blogs.search ? blogs.newBlogs.length : blogs.blogs.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return  BlogWidget(blog: blogs.search ? blogs.newBlogs[index]: blogs.blogs[index]);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
