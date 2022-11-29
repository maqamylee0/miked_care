// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

String screenTitle = "Find your \nPerfect Therapist \nOnline";
String screenDes = "At the heart of our business is a deep "
    "rooted devotion to providing care and warmth for women";

Color sliderColor =  Color(0xFF16E4E4);
List<ContentConfig> sliderData = [
  ContentConfig(
    title: "Live Consultation ",
    styleTitle: TextStyle(
      color: Colors.black,
      fontSize: 30,

      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoSlab',
    ),
    description:
        "Make a Live Consultation with Top Therapist \n\nOur Excitement to serve drives us to exceed our client's expectation every time",
    styleDescription: TextStyle(color: Colors.black, fontSize: 17),
    pathImage: "assets/therapist_image.webp",
  ),
  ContentConfig(
    title: "Mental Health ",
    styleTitle: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoSlab',
    ),
    description:
        "Best Maternal and Perinatal Mental Health Therapy \n\nProviding effective assistance for women is essential to help them thrive",
    styleDescription: TextStyle(color: Colors.black, fontSize: 17),
    pathImage: "assets/mental_image.png",
  ),
];
