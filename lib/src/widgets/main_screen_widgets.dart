import 'package:flutter/material.dart';
//import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
//import 'package:cached_network_image/cached_network_image.dart';

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

IconButton searchIcon({@required double size, @required Function function}) {
  return IconButton(
      icon: Icon(
        Icons.search,
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

Text customText() {
  return Text(
    "Wanna take a ride today?",
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
                    // child: Icon(
                    //   Icons.wb_sunny,
                    //   color: Colors.yellow,
                    //   size: containerHeight / 2,
                    // ),
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
        "Near You",
        style: customTextStyle(isBold: true),
      ),
      InkWell(
          onTap: function,
          child: Text(
            "Browse Map >",
            style: customTextStyle(),
          ))
    ],
  );
}

// Container vehicleCard() {
//   double containerHeight = 210.0;
//   return Container(
//     width: containerHeight * (1.1),
//     height: containerHeight,
//     child: Stack(
//       children: <Widget>[
//         Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(40.0),
//               color: Colors.white,
//             ),
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5.0),
//               child: Row(
//                 //crossAxisAlignment: CrossAxisAlignment.start,
//                 //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 1.0,
//                     ),
//                     child: Center(
//                       child: Image.asset(
//                         'assets/vehicle.png',
//                         height: containerHeight * (0.75),
//                         width: containerHeight * (1),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         Align(
//           alignment: Alignment(-0.90, 0.25),
//           child: SizedBox(
//             //  width: double.infinity,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: kGreenColor,
//               ),
//               // height: (containerHeight) / 4,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10.0,
//                   vertical: 5.0,
//                 ),
//                 child: Text(
//                   "Distance 150M",
//                   style: TextStyle(fontSize: fontSize),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: customVehicleText(),
//         ),
//       ],
//     ),
//   );
// }

// Padding customVehicleText() {
//   double size = 20.0;
//   return Padding(
//     padding: EdgeInsets.all(10.0),
//     child: RichText(
//       text: TextSpan(
//         text: "Cannaught Place\n",
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: size,
//         ),
//         children: [
//           TextSpan(
//             text: '1 Available',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//               fontSize: size,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
