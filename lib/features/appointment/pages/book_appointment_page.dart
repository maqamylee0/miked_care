import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/Utils/image_assets_constants.dart';
import 'package:miked_care/features/appointment/models/therapist.dart';
import 'package:miked_care/features/appointment/widgets/dashboard_button.dart';
import 'package:miked_care/services/therapist_service.dart';
import 'package:provider/provider.dart';

import '../../../providers/appointment_provider.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key,required this.therapistInfo}) : super(key: key);
 final Therapist therapistInfo;
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {

  @override
  void initState(){
    super.initState();
    // setIds();

      }

      @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    var totalWidth = MediaQuery.of(context).size.width;



    return Scaffold(
      body: SafeArea(
        child: Container(
          width: totalWidth,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                ),
                Container(
                  width: totalWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "${ImageAssetConstants.account}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100)),
                        height: 70,
                        width: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "${widget.therapistInfo.name}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${widget.therapistInfo.designation}",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                      Icon(Icons.comment, color: Colors.grey, size: 25)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("About",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          text:
                              "${widget.therapistInfo.about}"),
                      WidgetSpan(
                          child: SizedBox(
                        height: 18,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          onPressed: () {},
                          child: Text(
                            "View More",
                            style: TextStyle(

                                fontSize: 14),
                          ),
                        ),
                      ))
                      // 'Dr. Edidiong Ishola is one of the top perinatal '
                      //     'therapist in Nigeria. she has won several recognition in this field and has helped women in thier perinatal journey.',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700)),
                    ]))),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Working Time",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Monday - Saturday 08:00am - 08:00pm ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Reviews",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star_half,
                            size: 22,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("5.0(94 reviews)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500))
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "see all",
                          ))
                    ],
                  ),
                ),
                // Row(
                //
                //   children: [
                //     Column(
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Container(
                // width: totalWidth,
                // child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "${ImageAssetConstants.account}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100)),
                        height: 60,
                        width: 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_half,
                              size: 22,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("4")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //   ),
                Consumer<AppointmentProvider>(
             builder: (BuildContext context, value, Widget? child) {
               value.getTherapistReviews(widget.therapistInfo.reviewIds);
               // value.getUser(value.reviews[0].userId);


    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (value.reviews.isEmpty == true) ? Text(''):
                    Text("${value.username}",
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  );}
                ),
                Consumer<AppointmentProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  // AppointmentProvider().setreviewid(widget.therapistInfo.reviewIds);
                  // value.getTherapistReviews(widget.therapistInfo.reviewIds);
                  // value.getTherapistReviews(widget.therapistInfo.reviewIds);

                  // value.getTherapistReviews(widget.therapistInfo.reviewIds);

    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    // width: totalWidth*0.34,
    child: (value.reviews.isEmpty == true) ?Text(''):Text(
    "${value.message}",
    style: TextStyle(
    fontSize: 14,
    )),
    ),
    );
    }),

                //       ],
                //     ),
                //
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LargeButton(title: "Book appointment",path:"AppointmentForm"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> setIds() async {
  //   await AppointmentProvider().getTherapistReviews(widget.therapistInfo.reviewIds);
  //
  // }
}
