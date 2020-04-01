//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'home_screen_widgets.dart';
//import 'main_screen_widgets.dart';

Padding customVehicleCard(
    {String imageUrl, bool isAvailable, String location, String vehicleType}) {
  double containerHeight = 220.0;
  double containerWidth = containerHeight / (1.2);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      decoration: BoxDecoration(
        // color: Colors.green,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      //color: Colors.green,
      height: containerHeight,
      width: containerWidth,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Image.network(
            imageUrl,
            height: containerHeight / 2,
            width: containerWidth / 1.2,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: (isAvailable) ? kGreenColor : Colors.red,
            ),
            // height: (containerHeight) / 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              child: Text(
                (isAvailable) ? "Available" : "Unavailable",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          customVehicleText(location: location, vehicleType: vehicleType),
        ],
      ),
    ),
  );
}

Padding customVehicleText({String location, String vehicleType}) {
  double size = 20.0;
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: RichText(
      text: TextSpan(
        text: "$location \n",
        style: TextStyle(
          color: Colors.black,
          fontSize: size,
        ),
        children: [
          TextSpan(
            text: vehicleType,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: size,
            ),
          ),
        ],
      ),
    ),
  );
}
