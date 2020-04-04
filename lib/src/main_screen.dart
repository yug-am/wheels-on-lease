import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/location_screen.dart';
import 'package:wheels_on_lease/src/methods/dateTime.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/scan_ride.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/vehicleListWidget.dart';

import 'hide/hide.dart';
import 'model/ride_model.dart';
import 'model/user_data_model.dart';
import 'on_ride.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.customer, this.weatherData});
  final Customer customer;
  final List<String> weatherData;
  MainScreenState createState() =>
      MainScreenState(customer: customer, weatherData: weatherData);
}

class MainScreenState extends State<MainScreen> {
  MainScreenState({this.customer, this.weatherData});
  final Customer customer;
  List<String> weatherData;
  String cityName;
  String date;
  DocumentSnapshot documentSnapshot;
  Ride ride;
  Vehicle vehicle;
  bool onRide;
  @override
  void initState() {
    date = getDateTime();
    cityName = this.customer.city;
    onRide = customer.onRide;
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
                        (onRide)
                            ? rideScanIcon(
                                icon: Icons.directions_car,
                                size: 60.0,
                                function: () async {
                                  documentSnapshot = await rideRecord
                                      .document(customer.email)
                                      .collection("rides")
                                      .document(customer.activeRide)
                                      .get();

                                  ride = Ride.fromDocument(documentSnapshot);
                                  String city = customer.city.toLowerCase();
                                  DocumentSnapshot documentSnapshot1 =
                                      await vehicleRecord
                                          .document('$city')
                                          .collection('$city' 'Vehicles')
                                          .document("${ride.regNo.toString()}")
                                          .get();
                                  vehicle =
                                      Vehicle.fromDocuments(documentSnapshot1);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Material(
                                        child: OnRide(
                                          customer: customer,
                                          vehicle: vehicle,
                                          ride: ride,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : rideScanIcon(
                                icon: Icons.camera_enhance,
                                size: 60.0,
                                function: (onRide)
                                    ? () => print("tap")
                                    : () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Material(
                                              child: MaterialApp(
                                                debugShowCheckedModeBanner:
                                                    false,
                                                color: Colors.white,
                                                home: ScanRide(
                                                    customer: customer),
                                              ),
                                            ),
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
                      subText: customText(onRide: onRide),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Material(
                                child: LocationScreen(customer: customer,),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220.0,
                child: VehicleListWidget(cityName: cityName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
