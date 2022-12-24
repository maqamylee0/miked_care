
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key, required this.pathToIcon, required this.title,
  }) : super(key: key);

  final String pathToIcon;
  final String title ;
  @override
  Widget build(BuildContext context) {

    return
        Container(
          decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Color(0x7CCCCCCB),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: Card(

              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                    Center(
                      child: SvgPicture.asset(
                        '$pathToIcon',
                        height: 40.0,
                        width: 40.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ) ,

                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text("$title",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],

              )
          ),
        );

  }
}
