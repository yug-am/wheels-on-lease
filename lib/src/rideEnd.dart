import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/on_ride_widgets.dart';

//import 'methods/vehicleHandle.dart';
class RideEndScreen extends StatefulWidget {
  RideEndScreenState createState() => RideEndScreenState();
}

class RideEndScreenState extends State<RideEndScreen> {
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 99, 255, 1.0),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/sad.png",
                height: 200.0,
              ),
              Text(
                "Inconvenience is regretted",
                style: customTextStyleHeadline(),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "support team will contact you",
                style: customTextStyleHeadline(),
                textAlign: TextAlign.center,
              ),
              rideButton(
                  text: "Back to home page",
                  function: () {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 5;
                      });
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
