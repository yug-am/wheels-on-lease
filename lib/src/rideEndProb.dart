import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/model/ride_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/on_ride_widgets.dart';
import 'main_screen.dart';
import 'methods/weather.dart';
import 'model/user_data_model.dart';

class RideEndProbScreen extends StatefulWidget {
  RideEndProbScreen({this.customer, this.vehicle, this.ride});
  final Customer customer;
  final Vehicle vehicle;
  final Ride ride;
  RideEndProbScreenState createState() =>
      RideEndProbScreenState(customer: customer, vehicle: vehicle, ride: ride);
}

class RideEndProbScreenState extends State<RideEndProbScreen> {
  RideEndProbScreenState({this.customer, this.vehicle, this.ride});
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/sad.png",
                height: 200.0,
              ),
              Text(
                "Inconvenience is regretted",
                style: customTextStyleHeadline(),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "support team will contact you",
                style: customTextStyleHeadline(),
                textAlign: TextAlign.center,
              ),
              rideButton(
                  text: "Back to home page",
                  function: () async{
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
                    
                  },)
            ],
          ),
        ),
      ),
    );
  }
}
