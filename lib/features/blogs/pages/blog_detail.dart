import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/blogs/models/blog.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({Key? key, required this.blog}) : super(key: key);
 final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(

                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                    ),
                    Container(
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: Image.asset("assets/logo_black.png",
                              height: 200, width: 300),

                          //Image.asset("assets/img.png")
                        ),
                      ),
                    
                  ],
                ),

                // Text("${blog.title}",
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            '${blog.imageUrl}',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 20,),
                // Text("${blog.date}",
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 17,fontWeight: FontWeight.w400
                //     )),
                Text("${blog.title}.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 30,),
                Text("${blog.content}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,fontWeight: FontWeight.w400
                    )),
                Text("${blog.content}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,fontWeight: FontWeight.w400
                    )),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
