import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
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
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        onPressed: () {},
                      ),
          //             TextFormField(
          //               keyboardType: TextInputType.text,
          //               controller: _searchController,
          //             decoration: InputDecoration(
          //               labelText: 'Search', disabledBorder: InputBorder.none, ),
          // ),
                      IconButton(
                        iconSize: 25,
                        icon: Icon(Icons.settings),
                        color: Colors.black,
                        onPressed: () {},
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.all(6),
                    child: ListView.builder(

                        physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount:3,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){

                          return BlogWidget();
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

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("23-12-2022",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/emily.jpg"), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 120,
                width: 110,

              ),
SizedBox(
  width: 20,
),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      width: 180,
      child: Text("How to BreastFeed a child",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold)),
    ),
    SizedBox(
      height: 10,
    ),
    Text("10 mins read",
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            )),
    SizedBox(
      height: 10,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.share),
          color: Colors.black,
          onPressed: () {},
        ),
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.favorite),
          color: Colors.lightBlueAccent,
          onPressed: () {},
        ),
      ],
    )
  ],
)
            ],
          )
        ],
      ),
    );
  }
}