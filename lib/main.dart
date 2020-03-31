import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';

import 'package:wheels_on_lease/src/profile.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: MainScreen(),
       // home: MapScreen(),
       home: AuthInitScreen(),
      ),
    );
