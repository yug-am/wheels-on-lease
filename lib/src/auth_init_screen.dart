import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/login.dart';
import 'package:wheels_on_lease/src/signin.dart';
import 'package:wheels_on_lease/src/widgets/auth_init_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

class AuthInitScreen extends StatefulWidget {
  AuthInitState createState() => AuthInitState();
}

class AuthInitState extends State<AuthInitScreen> {
  bool logInActive = true;

  @override
  Widget build(BuildContext context) {
    void tapFunction(bool x) {
      setState(
        () {
          if (!x) {
            logInActive = !logInActive;
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      body: Container(
        color: kGreenColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 10.0, bottom: 20.0),
              child: Row(
                children: [
                  textButton(
                      isActive: logInActive,
                      buttonText: "Login",
                      function: () => tapFunction(logInActive)),
                  textButton(
                      isActive: !logInActive,
                      buttonText: "SignIn",
                      function: () => tapFunction(!logInActive)),
                ],
              ),
            ),
            Expanded(
              child: (logInActive) ? Login() : Signin(),
            )
          ],
        ),
      ),
    );
  }
}
