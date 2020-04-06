import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';

SizedBox decoHeader(
    {double height = 200.0, String customerGender, String customerName}) {
  return SizedBox(
    height: height,
    child: Container(
      color: kGreenColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height / 10),
          ),
          Center(
            child: customAvatar(
              gender: customerGender,
              radius: (height / 4),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 20, bottom: height / 10),
            child: Text(
              customerName,
              style: TextStyle(
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

Container roundedContainer({Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60),
      ),
    ),
    child: child,
  );
}

ListView customList({
  Widget widget0,
  Widget widget1,
  Widget widget2,
  Widget widget3,
  Widget widget4,
  Widget widget5,
}) {
  return ListView(
    children: <Widget>[widget0, widget1, widget2, widget3, widget4, widget5],
  );
}

InkWell optionTile({String text, double fontSize = 20.0,Function function }) {
  return InkWell(
    onTap: function,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: 2.0,
              child: Container(
                color: Colors.black12,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

InkWell logOutButton({@required double size, Function function}) {
  return InkWell(
    onTap: function,
    child: SizedBox(
      height: (size * 3),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            bottom: 20.0,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.power_settings_new,
                size: (size + 12.0),
              ),
              Text(
                "  Logout",
                style: TextStyle(
                  fontSize: size,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
