import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:uuid/uuid.dart';

import 'package:wheels_on_lease/src/hide/hide.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/on_ride.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/scanRideWidget.dart';

import 'methods/rideRecordMethods.dart';
import 'model/ride_model.dart';
import 'model/vehicle_model.dart';

class ScanRide extends StatefulWidget {
  ScanRide({this.customer});
  final Customer customer;
  ScanRideState createState() => ScanRideState(customer: customer); //
}

class ScanRideState extends State<ScanRide> {
  Vehicle vehicle;
  DocumentSnapshot documentSnapshot;
  final String rideId = Uuid().v4();
  static DateTime _timeNow = DateTime.now();
  String timeNow = _timeNow.toString();
  ScanRideState({this.customer});
  final Customer customer;
  Ride ride;
  String data;
  String scanText = "null";
  Future<Vehicle> scan() async {
    String cityName = customer.city;
    
    if (scanText == "null") {
      scanText = await scanner.scan();
      String _city = cityName.toLowerCase();
      DocumentSnapshot documentSnapshot = await vehicleRecord
          .document('$_city')
          .collection('$_city' 'Vehicles')
          .document('$scanText')
          .get();
      vehicle = Vehicle.fromDocuments(documentSnapshot);
      return vehicle;
    }
    return vehicle;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: scan(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

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
              function: () async {
                await createRideRecordStart(
                    rideId: rideId,
                    timeStampStart: timeNow,
                    customer: customer,
                    vehicle: vehicle);
                documentSnapshot = await rideRecord
                    .document(customer.email)
                    .collection("rides")
                    .document(rideId)
                    .get();
                ride = Ride.fromDocument(documentSnapshot);
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
            );
          }
        },
      ),
    );
  }
}
