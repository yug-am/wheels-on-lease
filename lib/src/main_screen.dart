import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: kLinearGradient),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customAvatar(radius: 50.0),
                    searchIcon(size: 30.0),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                mainTextColumn(
                  heading: customHeadText(),
                  subText: customText(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                customDateTempStack(),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  child: browseText(),
                ),
                vehicleCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
