import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/scanRideWidget.dart';

Container rideScreenColumn(
    {String imageUrl,
    String modelno,
    String location,
    String vehicleType,
    String time,
    Widget probBtn}) {
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
                "On Ride",
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
                    //child: Image.network(imageUrl),
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 80.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  "Model No. $modelno",
                  style: customRideTextStyle(fontSize: 20.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Type: ${vehicleType.toUpperCase()}",
                    style: customRideTextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "stared at- $time",
                    style: customRideTextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 160.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: probBtn,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        rideButton(text: "End Ride"),
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
              style: customRideTextStyle(fontSize: 20.0),
            ),
          ),
        ),
        onTap: function,
      ),
    ),
  );
}

Container onRideProb({Widget buttonOne, Widget buttonTwo}) {
  return Container(
    decoration: BoxDecoration(
      color: kGreenColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Report Problem",
              style: customTextStyle(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[buttonOne, buttonTwo],
            ),
          ],
        ),
      ),
    ),
  );
}

InkWell onRideProbButton(
    {IconData icon, Color iconColor, String text, Function function}) {
  return InkWell(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 40.0,
          color: iconColor,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        )
      ],
    ),
    onTap: function,
  );
}
