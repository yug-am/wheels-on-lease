import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/methods/rideRecordMethods.dart';
import 'package:wheels_on_lease/src/model/ride_model.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/rideEndProb.dart';
import 'package:wheels_on_lease/src/ride_end.dart';
import 'package:wheels_on_lease/src/widgets/on_ride_widgets.dart';
import 'methods/dateTime.dart';

class OnRide extends StatefulWidget {
  OnRide({this.customer, this.vehicle, this.ride});
  final Customer customer;
  final Ride ride;
  final Vehicle vehicle;
  OnRideState createState() =>
      OnRideState(customer: customer, vehicle: vehicle, ride: ride);
}

class OnRideState extends State<OnRide> {
  OnRideState({this.customer, this.vehicle, this.ride});
  final Customer customer;
  final Ride ride;
  final Vehicle vehicle;
  static DateTime _timeNow = DateTime.now();
  String timeNow = _timeNow.toString();
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: rideScreenColumn(
        function: () async {
          await createRideRecordEnd(
            customer: customer,
            ride: ride,
            vehicle: vehicle,
            timeStampEnd: timeNow,
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Material(
                child: RideEndScreen(
                  customer: customer,
                  vehicle: vehicle,
                  ride: ride,
                ),
              ),
            ),
          );
        },
        imageUrl: ride.imageUrl,
        modelno: ride.regNo.toString(),
        location: ride.location,
        vehicleType: ride.vehicleType,
        time: getTime(dateTime: DateTime.parse(ride.timeStart)),
        probBtn: onRideProb(
          buttonOne: onRideProbButton(
            iconColor: Colors.red,
            icon: Icons.lock,
            text: "not unlocking",
            function: () async {
                        
              await createRideRecordEndProb(
                  timeStampEnd: timeNow,
                  vehicle: vehicle,
                  customer: customer,
                  ride: ride,
                  probS: "Unlock Issues",
                  );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: RideEndProbScreen(
                      customer: customer,
                      vehicle: vehicle,
                      ride: ride,
                    ),
                  ),
                ),
              );
            },
          ),
          buttonTwo: onRideProbButton(
            iconColor: Colors.yellow,
            icon: Icons.error,
            text: "mech prob",
            function: ()async {
              await createRideRecordEndProb(
                  timeStampEnd: timeNow,
                  vehicle: vehicle,
                  customer: customer,
                  ride: ride,
                  probS: "Mech Issues",
                  );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Material(
                    child: RideEndProbScreen(
                      customer: customer,
                      vehicle: vehicle,
                      ride: ride,
                    ),
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
