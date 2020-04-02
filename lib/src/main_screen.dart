//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/methods/dateTime.dart';
import 'package:wheels_on_lease/src/scan_ride.dart';
//import 'package:wheels_on_lease/src/search.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/vehicleListWidget.dart';

//import 'map_screen.dart';
//import 'methods/weather.dart';
import 'model/user_data_model.dart';
//import 'widgets/vehicle_card.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.customer, this.weatherData});
  final Customer customer;
  final List<String> weatherData;
  MainScreenState createState() =>
      MainScreenState(customer: customer, weatherData: weatherData);
}

class MainScreenState extends State<MainScreen> {
  String testUrl = "https://i.picsum.photos/id/304/200/200.jpg";
  String testUrl2 = "https://i.picsum.photos/id/15/200/300.jpg";
  Customer customer;
  List<String> weatherData;
  MainScreenState({this.customer, this.weatherData});
  String x;
  String cityName;

  String date;
  bool refreshed;
  //String sampleDpUrl = "https://i.picsum.photos/id/336/200/200.jpg";
  @override
  void initState() {
    date = getDateTime();
    cityName = this.customer.city;
    // print('here $cityName');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kGreenColor,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: kLinearGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        customAvatar(radius: 50.0, gender: customer.gender),
                        rideScanIcon(
                          size: 30.0,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>Material(child: MaterialApp(
                                  debugShowCheckedModeBanner: false,
                                  color: Colors.white,
                                  home: ScanRide(customer: customer),
                                ),
                                ),
                                // builder: (context) =>Material(child: ScanRide(customer:customer),),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    mainTextColumn(
                      heading: customHeadText(username: "${customer.name}"),
                      //username: "test"),
                      subText: customText(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    customDateTempStack(
                      date: date,
                      temp: weatherData[0],
                      status: weatherData[1],
                      icon: weatherData[2],
                      cityName: customer.city,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: browseText(
                        function: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MapScreen(),
                          //   ),
                          // );
                          print('tap');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220.0,

                child: VehicleListWidget(cityName: cityName),
                // child: ListView(
                //   // This next line does the trick.
                //   scrollDirection: Axis.horizontal,
                //   children: <Widget>[

                //     customVehicleCard(
                //         imageUrl: testUrl, isAvailable: true, location: "cp"),
                //         customVehicleCard(
                //         imageUrl: testUrl2, isAvailable: false, location: "janpath"),
                //         customVehicleCard(
                //         imageUrl: testUrl, isAvailable: true, location: "karol bagh"),
                //         customVehicleCard(
                //         imageUrl: testUrl2, isAvailable: true, location: "cp"),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
