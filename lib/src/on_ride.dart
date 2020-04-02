import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/rideEnd.dart';
import 'package:wheels_on_lease/src/widgets/on_ride_widgets.dart';
import 'methods/dateTime.dart';

//import 'methods/vehicleHandle.dart';
class OnRide extends StatefulWidget {
  OnRide({this.customer, this.vehicle, this.dateTime});
  final Customer customer;
  final Vehicle vehicle;
  final DateTime dateTime;
  OnRideState createState() => OnRideState(customer, vehicle, dateTime);
}

class OnRideState extends State<OnRide> {
  OnRideState(this.customer, this.vehicle, this.dateTime);
  final Customer customer;
  final Vehicle vehicle;
  final DateTime dateTime;
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: rideScreenColumn(
        imageUrl: vehicle.imageUrl,
        modelno: vehicle.regNo.toString(),
        location: vehicle.location,
        vehicleType: vehicle.vehicleType,
        time: getTime(dateTime: dateTime),
        probBtn: onRideProb(
          buttonOne: onRideProbButton(
            iconColor: Colors.red,
            icon: Icons.lock,
            text: "not unlocking",
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: RideEndScreen(),
                  ),
                ),
              );
            },
          ),
          buttonTwo: onRideProbButton(
            iconColor: Colors.yellow,
            icon: Icons.error,
            text: "mech prob",
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: RideEndScreen(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
