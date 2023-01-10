import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/models/review.dart';
import 'package:miked_care/features/appointment/models/therapist.dart';
import 'package:miked_care/services/therapist_service.dart';
import 'package:provider/provider.dart';

import '../../../Utils/image_assets_constants.dart';
import '../../../providers/appointment_provider.dart';
import '../../auth/models/user.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({Key? key, required this.review}) : super(key: key);
final Review review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
   UserModel? user;
  @override
  void initState() {
    super.initState();
    getvalues();

  }
  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
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
          // TextButton(
          //     onPressed: () {
          //       showBottomSheet(context: context, builder: (BuildContext context){
          //         return ReviewList(reviews: reviews.reviews );
          //       });
          //     },
          //     child: Text(
          //       "see all",
          //     ))



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
     Padding(
              padding: const EdgeInsets.all(8.0),
              child: (user == null) ? Text('') :
              Text("${user?.name}",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),


      Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // width: totalWidth*0.34,
                child: (user == null) ? Text('') : Text(
                    "${widget.review.message}",
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ),


      ],
    ),);
  }

  Future<void> getvalues() async {
    TherapistService therapistService = TherapistService();
    UserModel user1 = await therapistService.getUserDetails(widget.review.userId!);

    setState(()  {
     user = user1;
     print(user?.name);
    });
  }
}
