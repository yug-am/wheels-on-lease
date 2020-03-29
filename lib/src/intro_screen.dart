//import 'package:flutter/cupertino.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  TextStyle textStyle() {
    return TextStyle(color: Colors.black, fontSize: 20.0);
  }

  TextStyle textStyleHeadline() {
    return TextStyle(
        color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);
  }

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "SELECT IT",
        styleTitle: textStyleHeadline(),
        description: "Select from rides near you.",
        styleDescription: textStyle(),
        pathImage: "assets/order_a_car.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "LEASE IT",
        styleTitle: textStyleHeadline(),
        description: "Lease vehicles at an affordable rate .",
        styleDescription: textStyle(),
        pathImage: "assets/fast_car.png",
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "RIDE IT",
        styleTitle: textStyleHeadline(),
        description: "Ride with freedom .",
        styleDescription: textStyle(),
        pathImage: "assets/navigator.png",
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
        styleNameDoneBtn: TextStyle(color: Colors.black),
        styleNameSkipBtn: TextStyle(color: Colors.black),
      ),
    );
  }
}
