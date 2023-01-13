import 'package:flutter/cupertino.dart';
import 'package:miked_care/features/appointment/models/review.dart';
import 'package:miked_care/features/appointment/widgets/review_card.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key, required this.reviews}) : super(key: key);
final List<Review> reviews;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(

          physics: ScrollPhysics(),
          // shrinkWrap: true,
          itemCount:reviews.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){


            return ReviewCard(review:reviews[index]);
          }),
    );
  }
}
