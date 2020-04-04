import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/option_screen_widgets.dart';

class OptionScreen extends StatefulWidget {
  OptionScreenState createState() => OptionScreenState();
}

class OptionScreenState extends State<OptionScreen> {
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kGreenColor,
      child: Center(
        child: Column(
          children: <Widget>[
            decoHeader(height: 220.0),
            Flexible(
              child: roundedContainer(
                child: customList(
                  widget1: optionTile(text: "My Wallet"),
                  widget2: optionTile(text: "My Statistics"),
                  widget3: optionTile(text: "Invite Friends"),
                  widget4: optionTile(text: "Support"),
                  widget5: optionTile(text: "Settings"),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomLeft,
              child: logOutButton(size: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
