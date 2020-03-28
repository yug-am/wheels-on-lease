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
RaisedButton customHomeScreenButton({Function function}) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40.0)),
    color: Colors.white,
    onPressed: function,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 70.0,vertical: 16.0),
      child: Text(
        "Get Started",
        style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w300),
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
        style: TextStyle(color:Colors.black),
        children: [
          TextSpan(
              text: ' Log in',
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('login tapped');
                }),
        ],
      ),
    ),
  );
}
