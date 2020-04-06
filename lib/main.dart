import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

void main() => runApp(
      MaterialApp(
        color: kGreenColor,
        debugShowCheckedModeBanner: false,
         home: AuthInitScreen(),
        // home: Material(color: kGreenColor,
        //   child: Wallet(),
        // ),
      ),
    );
