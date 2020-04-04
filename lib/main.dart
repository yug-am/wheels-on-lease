import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';
import 'package:wheels_on_lease/src/location_screen.dart';
import 'package:wheels_on_lease/src/location_vehicles.dart';
import 'package:wheels_on_lease/src/option_screen.dart';
void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
      //   home: AuthInitScreen(),
        // home: LocationVehicle()
        home: OptionScreen(),
      ),
    );
