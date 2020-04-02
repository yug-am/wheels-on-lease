import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';
import 'package:wheels_on_lease/src/private/experimetal.dart';
import 'package:wheels_on_lease/src/rideEnd.dart';
//import 'package:wheels_on_lease/src/private/experimetal.dart';
//import 'package:wheels_on_lease/src/scan_ride.dart';
//import 'package:wheels_on_lease/src/private/qr.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
         home: AuthInitScreen(),
      //home: ScanRide(),
    //   home: RideEndScreen (),
        // home: MapScreen(),
        //  home: SearchScreen(),
      ),
    );
