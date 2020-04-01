import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';
import 'package:wheels_on_lease/src/private/experimetal.dart';
//import 'package:wheels_on_lease/src/private/qr.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SearchScreen(),
        //home: AuthInitScreen(),
        home: Experiment(),
        // home: MapScreen(),
        //  home: SearchScreen(),
      ),
    );
