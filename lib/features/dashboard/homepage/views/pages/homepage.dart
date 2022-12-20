import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 80, 30, 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text("Hello, Sarah",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Stack(
                clipBehavior: Clip.none, children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipOval(

                          child: Image.asset("personimage/emily.jpg",height: 200,width: 200,
                          ),
                        )
                    ),
                  ),
                  Positioned(
                    left: 50,
                      bottom: -20,
                      child: Icon(Icons.circle_notifications_rounded,color: Colors.grey,size: 40,))
                ],
              )

            ],
          )
        ],
      ),

    );
  }
}
