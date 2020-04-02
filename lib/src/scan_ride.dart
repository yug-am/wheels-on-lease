import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:wheels_on_lease/src/hide/hide.dart';
//import 'package:wheels_on_lease/src/methods/dateTime.dart';
//import 'package:wheels_on_lease/src/methods/vehicleHandle.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/on_ride.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/scanRideWidget.dart';

import 'model/vehicle_model.dart';

//import 'methods/vehicleHandle.dart';
class ScanRide extends StatefulWidget {
  ScanRide({this.customer});
  final Customer customer;
  ScanRideState createState() => ScanRideState(customer: customer); //
}

class ScanRideState extends State<ScanRide> {
  Vehicle vehicle;
  ScanRideState({this.customer});
  final Customer customer;
  String data;
  String scanText= "null";
  Future<Vehicle> scan() async {
    String cityName = customer.city;
    print(customer.city);
    print(customer.email);
    if(scanText =="null")
    {scanText = await scanner.scan();
    String _city = cityName.toLowerCase();
    DocumentSnapshot documentSnapshot = await vehicleRecord
        .document('$_city')
        .collection('$_city' 'Vehicles')
        .document('$scanText')
        .get();
    vehicle = Vehicle.fromDocuments(documentSnapshot);
    return vehicle;}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: scan(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text(
                  "Loading...",
                  style: customTextStyle(),
                ),
              ),
            );
          } else {
            return rideScreenColumn(
              imageUrl: snapshot.data.imageUrl,
              modelno: snapshot.data.regNo.toString(),
              vehicleType: snapshot.data.vehicleType,
              location: snapshot.data.location,
              isAvailable: snapshot.data.isAvailable,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Material(
                      child: OnRide(
                        customer: customer,
                        vehicle: vehicle,
                        dateTime: DateTime.now(),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
