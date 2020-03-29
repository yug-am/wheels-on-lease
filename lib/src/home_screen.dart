import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/intro_screen.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _navFunc(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: IntroScreen(),
                )),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: kLinearGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 120.0),
                child: Center(
                  child: Icon(
                    Icons.toys,
                    color: Colors.white,
                    size: 200.0,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: customHomeScreenButton(
                        isHomeScreen: true,
                        buttonText: "Get Started",
                        function: () {
                          _navFunc(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Center(
                      child: customHomeScreenText(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
