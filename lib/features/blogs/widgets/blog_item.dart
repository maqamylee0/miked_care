

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/blogs/pages/blog_detail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:reading_time/reading_time.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../../../providers/blog_provider.dart';
import '../../../providers/user_provider.dart';
import '../models/blog.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    Key? key,
    required this.blog,
  }) : super(key: key);
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final blogs = Provider.of<BlogProvider>(context);
    final user = Provider.of<UserProvider>(context);

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return BlogDetail(blog: blog);
          }),
        );
      },
      child: Container(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${blog.date}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                // Container(
                //   height: 170,
                //   width: 110,
                //   //       width: 110,
                //   child: CachedNetworkImage(
                //   imageUrl: '${blog.imageUrl}',
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            '${blog.imageUrl}',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  width: 110,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text("${blog.title}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${readingTime(blog.content!).msg}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 180 ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.share),
                            color: Colors.black,
                            onPressed: () async {
                              // final url = await Uri.parse('${blog.imageUrl}');
                              // final response = await http.get(url);
                              // final bytes = await response.bodyBytes;
                              // final temp = await getTemporaryDirectory();
                              // final path = '${temp.path}/brest5.jpeg';
                              // // File imgFile =  File(path);
                              //
                              // XFile? file = await XFile(path);
                              // // file.writeAsBytesSync(response.bodyBytes);
                              //
                              // print('path $path');
                              // // File(path).writeAsBytesSync(bytes);
                              // // Share.share('${blog.title}', subject: '${blog.content}');
                              // await Share.shareXFiles([file],text: '${blog.title}');
                              // // Files(, text: '${blog.title}');
                             Share.share('${blog.title} \n ${blog.content}  ',subject: '${blog.content}');
                            },
                          ),
                          blogs.fav.contains(blog.uid) ? IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.favorite),
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                              blogs.removeFromFav(blog);

                            },
                          ):IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.favorite_outline),
                            color: Colors.lightBlueAccent,
                            onPressed: () {
                             blogs.addToFav(blog);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
