import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/model/ride_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/widgets/on_ride_widgets.dart';
import 'main_screen.dart';
import 'methods/dateTime.dart';
import 'methods/weather.dart';
import 'model/user_data_model.dart';

class RideEndScreen extends StatefulWidget {
  RideEndScreen({this.customer, this.vehicle, this.ride});
  final Customer customer;
  final Vehicle vehicle;
  final Ride ride;
  RideEndScreenState createState() =>
      RideEndScreenState(customer: customer, vehicle: vehicle, ride: ride);
}

class RideEndScreenState extends State<RideEndScreen> {
  RideEndScreenState({this.customer, this.vehicle, this.ride});
  final Customer customer;
  final Vehicle vehicle;
  final Ride ride;
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 99, 255, 1.0),
      body: Center(
        child: rideScreenColumn(
          onRide: false,
          function: () async {
            List<String> weatherData =
                await currentWeather(cityName: customer.city);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(
                  customer: customer,
                  weatherData: weatherData,
                ),
              ),
            );

          },
          vehicleType: ride.vehicleType,
          location: ride.location,
          modelno: ride.regNo.toString(),
          imageUrl: ride.imageUrl,
          time: getTime(dateTime: DateTime.parse(ride.timeStart)),
        ),
      ),
    );
  }
}
