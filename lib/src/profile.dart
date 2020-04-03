
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/hide/hide.dart';
import 'package:wheels_on_lease/src/widgets/auth_init_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/profile_widgets.dart';
import 'login.dart';
import 'main_screen.dart';
import 'methods/weather.dart';
import 'model/user_data_model.dart';

class Profile extends StatefulWidget {
  Profile({this.customerEmail});
  final String customerEmail;
  ProfileState createState() => ProfileState(customerEmail);
}

class ProfileState extends State<Profile> {
  List<String> weatherData;
  String customerEmail;
  ProfileState(this.customerEmail);
  Customer customer;
  DocumentSnapshot documentSnapshot;
  String selectedGender = "Female";
  final _formKey = GlobalKey<FormState>();
  static const List<String> cities = ['Delhi', 'Mumbai', 'Chennai', 'Kolkata'];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  userLogin({String email, String pass, BuildContext context}) {

  }

  String selectedCity = cities[0];
  dropDownChange(String selected) {
    setState(() {
      selectedCity = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Profile Setup',
                    style: textStyleHeadline(),
                  ),
                ),
                userField(
                  textEditingController: _nameController,
                  validatorFunction: nameValidatorFunction,
                  keyboardType: TextInputType.text,
                  labelText: "Name",
                  hintText: "name here",
                ),
                userField(
                  textEditingController: _ageController,
                  validatorFunction: ageValidatorFunction,
                  labelText: "Age",
                  hintText: "your age",
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Text(
                      "Gender Select",
                      style: TextStyle(color: Colors.black, fontSize: 30.0),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    customGenderButton(
                      buttonGender: "Male",
                      currentGender: selectedGender,
                      function: () {
                        setState(
                          () {
                            selectedGender = "Male";
                          },
                        );
                      },
                    ),
                    customGenderButton(
                      buttonGender: "Female",
                      currentGender: selectedGender,
                      function: () {
                        setState(
                          () {
                            selectedGender = "Female";
                          },
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Select City",
                      style: textStyle(),
                    ),
                    customDropDownButton(
                        context: context,
                        dropDownList: cities,
                        function: dropDownChange,
                        selected: selectedCity),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: customHomeScreenButton(
                      buttonText: 'Submit',
                      function: () async {
                        if (_formKey.currentState.validate()) {
                          userRecord.document(customerEmail).setData(
                            {
                              "name": _nameController.text,
                              "gender": selectedGender,
                              "age": _ageController.text,
                              "city": selectedCity,
                              "email": customerEmail,
                              "onRide": false,
                              "activeRide": "nil"
                            },
                          );
                          documentSnapshot =
                              await userRecord.document(customerEmail).get();
                          customer = Customer.fromDocument(documentSnapshot);
                          weatherData =
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
      ),
    );
  }
}
