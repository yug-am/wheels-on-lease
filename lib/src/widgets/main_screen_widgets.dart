import 'package:flutter/material.dart';

const double fontSize = 20;
TextStyle customTextStyle({bool isBold = false}) {
  return TextStyle(
      color: Colors.black,
      fontSize: fontSize,
      fontWeight: (isBold) ? FontWeight.bold : FontWeight.w400);
}

TextStyle customTextStyleHeadline() {
  return TextStyle(
      color: Colors.black,
      fontSize: fontSize + 10,
      fontWeight: FontWeight.bold);
}

CircleAvatar customAvatar(
    {@required double radius, String imageUrl, String gender}) {
  return CircleAvatar(
    radius: (radius + 3),
    backgroundColor: Colors.white,
    child: CircleAvatar(
      radius: radius,
      child: Image.asset(
        'assets/gender/$gender.png',
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white, //kPurpleColor,
    ),
  );
}

IconButton rideScanIcon({@required double size, @required Function function,IconData icon}) {
  return IconButton(
      icon: Icon(
        icon,
        color: Colors.black,
        size: size,
      ),
      onPressed: function);
}

Text customHeadText({@required String username}) {
  return Text(
    "Hello $username,",
    style: customTextStyleHeadline(),
  );
}

Text customText({@required bool onRide }) {
  return Text(
   (onRide)? "Ride Joyfully,Ride Responsibly":"Wanna take a ride today?",
    style: customTextStyle(),
  );
}

Column mainTextColumn({Text heading, Text subText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      heading,
      Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: subText,
      )
    ],
  );
}

Container customDateTempStack(
    {String date, String temp, String status, String cityName, String icon}) {
  double containerHeight = 140.0;
  return Container(
    height: containerHeight,
    child: Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.white54,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: containerHeight / 40,
                      left: containerHeight / 7,
                    ),
                    child: Image.network(
                      'http://openweathermap.org/img/wn/$icon@2x.png',
                      height: containerHeight / 2,
                      width: containerHeight / 2,
                      fit: BoxFit.fill,
                    ),
                    
                  ),
                  customTempText(
                      temp: temp, cityName: cityName, status: status),
                ],
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              height: (containerHeight) / 4,
              child: Text(
                date,
                style: TextStyle(fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Padding customTempText({String temp, String status, String cityName}) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: RichText(
      text: TextSpan(
        text: "$temp° ",
        style: TextStyle(
          color: Colors.black,
          fontSize: (fontSize + 20),
        ),
        children: [
          TextSpan(
            text: '$status\n',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: cityName,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Row browseText({@required Function function}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        "Avialble Rides",
        style: customTextStyle(isBold: true),
      ),
      InkWell(
          onTap: function,
          child: Text(
            "Browse Rides >",
            style: customTextStyle(),
          ))
    ],
  );
}

