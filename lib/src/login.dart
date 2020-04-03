import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/auth_init_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

import 'hide/hide.dart';
import 'main_screen.dart';
import 'methods/weather.dart';
import 'model/user_data_model.dart';

TextStyle textStyle() {
  return TextStyle(color: Colors.black, fontSize: 20.0);
}

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  FirebaseUser _user;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  userLogin({String email, String pass, BuildContext context}) async {
    try {
      AuthResult res =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      user = res.user;
      return user;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: userField(
                  textEditingController: _emailController,
                  validatorFunction: emailValidatorFunction,
                  labelText: "Email",
                  hintText: "email here",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: userField(
                  textEditingController: _passController,
                  validatorFunction: passValidatorFunction,
                  labelText: "Password",
                  hintText: "password here",
                  isObscure: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: customHomeScreenButton(
                    buttonText: 'login',
                    function: () async {
                      if (_formKey.currentState.validate()) {
                        _user = await userLogin(
                            email: _emailController.text,
                            pass: _passController.text,
                            context: context);
                        

                        DocumentSnapshot documentSnapshot =
                            await userRecord.document(_user.email).get();

                        Customer customer =
                            Customer.fromDocument(documentSnapshot);
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
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
