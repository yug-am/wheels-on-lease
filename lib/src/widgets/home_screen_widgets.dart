import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const Color kBlueColor = Color.fromRGBO(2, 246, 242, 1.0);
const Color kGreenColor = Color.fromRGBO(15, 255, 121, 1.0);
const LinearGradient kLinearGradient = LinearGradient(
  colors: [
    kGreenColor,
    kBlueColor,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
RaisedButton customHomeScreenButton(
    {Function function, String buttonText, bool isHomeScreen = false}) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    color: (isHomeScreen) ? Colors.white : kBlueColor,
    onPressed: function,
    child: Padding(
      padding: (isHomeScreen)
          ? EdgeInsets.symmetric(horizontal: 70.0, vertical: 16.0)
          : EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 10.0,
            ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Padding customHomeScreenText() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: RichText(
      text: TextSpan(
        text: "Already have an account?",
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: ' Log in',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('login tapped');
                }),
        ],
      ),
    ),
  );
}
