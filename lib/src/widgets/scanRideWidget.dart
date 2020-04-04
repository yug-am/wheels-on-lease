import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
LinearGradient kButtonGradient = LinearGradient(
  colors: [kGreenColor, kBlueColor],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
TextStyle customRideTextStyle({
  double fontSize =30.0,
  bool isBold = false,
}) {
  return TextStyle(
      color: kPurpleColor,
      fontSize: fontSize,
      decoration: TextDecoration.none,
      fontWeight: (isBold) ? FontWeight.bold : FontWeight.w400);
      
}

Container rideScreenColumn(
    {String imageUrl, String modelno, String location, String vehicleType,bool isAvailable,Function function}) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(gradient: kButtonGradient),
          height: 100.0,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                "Scanned Ride",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 80.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  "Model No. $modelno",
                  style: customRideTextStyle(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Type: ${vehicleType.toUpperCase()}",
                    style: customRideTextStyle(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Location: ${location.toUpperCase()}",
                    style: customRideTextStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
        (isAvailable)?rideButton(text:"Available",function:function ):rideButton(text:"Not Availble",function:()=>print("tap")),
      ],
    ),
  );
}

Padding rideButton({String text, Function function}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
    child: Center(
      child: InkWell(
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            gradient: kButtonGradient,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Text(
              text,
              style: customRideTextStyle(),
            ),
          ),
        ),
        onTap: function
      ),
    ),
  );
}
