import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

SizedBox decoAltHeader(
    {double height = 200.0, String title, Function function}) {
  return SizedBox(
    height: height,
    //width: double.infinity,
    child: Container(
      color: kGreenColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: height / 10),
          ),
          Padding(
            padding: EdgeInsets.only(left: height / 30),
            child: IconButton(
                icon: Icon(Icons.arrow_back, size: 40.0), onPressed: function),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height / 20, bottom: height / 10, left: height / 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(padding: EdgeInsets.only(top:40.0),)
        ],
      ),
    ),
  );
}

Padding optionActionLabel(
    {String labelText, String labelData, Function function, bool actionReqd}) {
  double size = 25.0;
  double paddingHorizontal = 20.0;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: '$labelText \n',
            style: TextStyle(color: Colors.black, fontSize: size),
            children: <TextSpan>[
              TextSpan(
                text: '$labelData',
                style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: function,
          child: SizedBox(
            height: 40.0,
            width: 80.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Center(
                child: Text(
                  "Top Up",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

InkWell optionLabel({
  String labelText,
  Function function,
}) {
  double size = 25.0;
  double paddingHorizontal = 20.0;
  return InkWell(
    onTap: function,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: '$labelText \n',
              style: TextStyle(color: Colors.black, fontSize: size),
              children: <TextSpan>[],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: size,
          )
        ],
      ),
    ),
  );
}

SizedBox ridePassCard({
  Function function,
  String labelText,
  String labelData,
  double size = 20.0,
}) {
  double height = 200.0;
  double width = 300.0;
  return SizedBox(
    height: height,
    width: width,
    child: Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Image.asset(
              'assets/new_assets/ride.png',
              width: width / 2,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  text: '$labelText \n',
                  style: TextStyle(color: Colors.black, fontSize: size),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$labelData',
                      style: TextStyle(
                          fontSize: size, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
             InkWell(onTap: function,child: SizedBox(
                height: 36.0,
                width: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Purchase",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),)
            ],
          )
        ],
      ),
    ),
  );
}
