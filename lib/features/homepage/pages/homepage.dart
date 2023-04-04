import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/appointment/pages/book_appointment_page.dart';
import 'package:miked_care/features/homepage/pages/widgets/cached_image_widget.dart';
import 'package:miked_care/features/homepage/pages/widgets/circular_avatar.dart';
import 'package:miked_care/features/homepage/pages/widgets/therapist_widget.dart';
import 'package:miked_care/providers/appointment_provider.dart';
import 'package:miked_care/providers/user_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'widgets/icon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final therapists = Provider.of<AppointmentProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<UserProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                          return (value.isLoaded == true)
                              ? Text("Hello, ${value.username.split(" ")[1]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                              : Text("",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold));
                        },
                      ),
                      SizedBox(
                        height: 70,width: 70,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Consumer<UserProvider>(
                              builder:
                                  (BuildContext context, value, Widget? child) {
                                return (value.photonull == true)
                                    ? SizedBox(width: 50,height: 50,
                                      child: CircularAvator(
                                          image_path: ImageAssetConstants.account),
                                    )
                                    : Image.asset(value.photoUrl);
                                // CachedImage(
                                //         image_path: value.photoUrl);
                              },
                            ),
                            Positioned(
                                left: 40,
                                bottom: -10,
                                child: Icon(
                                  Icons.circle_notifications_rounded,
                                  color: Colors.grey,
                                  size: 40,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                Container(
                  height: 130,
                  // padding: EdgeInsets.all(6),
                  child: ListView.builder(

                      physics: ScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount:therapists.therapists.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){


                        return TherapistItem( therapistInfo: therapists.therapists[index],);
                      }),
                ),




                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
                    child: Text(
                      "My Progress : 0 % complete",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                 SizedBox(height: 10,),
                  LinearPercentIndicator(
                    // width: MediaQuery.of(context).size.width*0.35,
                    animation: true,
                    lineHeight: 11.0,

                    animationDuration: 2500,
                    percent: 0.8,
                    // center: Text("80.0%"),
                    barRadius: Radius.circular(30),

                    progressColor: Colors.cyanAccent,
                    backgroundColor: Colors.grey,
                    // linearGradientBackgroundColor: LinearGradient(
                    //   colors: [
                    //     Colors.white,
                    //     Colors.white,
                    //   ],
                    // ),
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Apply for Financial Aid",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12),
                        ),
                      )),
                  // SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 4, 0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.39,
                    child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: (1 / .75),
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        children: const [
                          IconCard(
                              pathToIcon: 'assets/icons/postpartum.svg',
                              title: 'PostPartum'),
                          IconCard(
                              pathToIcon: 'assets/icons/pregsupport.svg',
                              title: 'Pregnancy \n Support'),
                          IconCard(
                              pathToIcon: 'assets/icons/preconception.svg',
                              title: 'Preconception'),
                          IconCard(
                              pathToIcon: 'assets/icons/checkin.svg',
                              title: 'Checkin'),
                        ]),
                  )
                ],
              ),
            )),
      ),
    );
  }
}




