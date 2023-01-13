import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miked_care/features/appointment/models/therapist.dart';

import '../../../appointment/models/review.dart';
import '../../../appointment/pages/book_appointment_page.dart';

class TherapistItem extends StatelessWidget {
  const TherapistItem({
    Key? key, required this.therapistInfo,
  }) : super(key: key);
  final Therapist therapistInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Color(0x7CCCCCCB),
              blurRadius: 20.0,
            ),
          ],
        ),
        height: 130,
        // width: MediaQuery.of(context).size.width*0.7,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        width: 90,
                        height: 90,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/personimage/emily.jpg",
                            height: 200,
                            width: 200,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // SizedBox(height: MediaQuery.of(context).size.width*0.01,),

                    SizedBox(
                      // width:MediaQuery.of(context).size.width*0.5,
                        child:  Text(
                          "${therapistInfo.name}\n"
                              "${therapistInfo.designation}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        )),

                    SizedBox(
                      height: MediaQuery.of(context).size.width *
                          0.01,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Fee : #30,000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     BookAppointment(therapistInfo:therapistInfo)));
                          },
                          child: Text(
                            "View Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyanAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}