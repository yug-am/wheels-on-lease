import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
//import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

SizedBox locationVehicleTop(
    {double height = 200.0, Widget infoRow1, Widget infoRow2,String imageLink}) {
  return SizedBox(
    height: height,
    child: Container(
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Expanded(child:Image.network(
              '$imageLink',
              fit: BoxFit.cover,
              height: height / 3,
            ),)
          ),
          Container(child: infoRow1),
          Container(child: infoRow2),
        ],
      ),
    ),
  );
}

SizedBox locationInfoRow(
    {double height, Widget palet1, Widget palet2, Widget palet3}) {
  return SizedBox(
    height: height,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        palet1,
        palet2,
        palet3,
      ],
    ),
  );
}

InkWell locationLink({double height, String link}) {
  return InkWell(
    onTap: ()=>launch(link),
    child: SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 10),
              color: kGreenColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.map,
                size: 30.0,
                color: kPurpleColor,
              ),
              Text(
                "Location On Map",
                style: TextStyle(fontSize: 30.0, color: kPurpleColor),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Padding miniInfoPalet({String label, String data}) {
  double size = 20.0;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: RichText(
      text: TextSpan(
        text: "$data \n",
        style: TextStyle(
          color: Colors.black,
          fontSize: size,
          fontWeight: FontWeight.w700,
        ),
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: size,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}
Padding customVehicleCardLocation(
    {String imageUrl, bool isAvailable, String location, String vehicleType}) {
  double containerHeight = 200.0;
  double containerWidth = containerHeight ;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: containerHeight,
      width: containerWidth,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2.0),
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 2.0,
              ),
              child: Text(
                (isAvailable) ? "Available" : "Unavailable",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          customVehicleTextLocation(location: location, vehicleType: vehicleType),
        ],
      ),
    ),
  );
}
Padding customVehicleTextLocation({String location, String vehicleType}) {
  double size = 20.0;
  return Padding(
    padding: EdgeInsets.only(top:10.0),
    child: RichText(
      text: TextSpan(
        text: "$vehicleType",
        style: TextStyle(
          color: Colors.black,
          fontSize: size,
        ),
      ),
    ),
  );
}


