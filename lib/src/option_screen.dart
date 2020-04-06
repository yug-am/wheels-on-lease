import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/auth_init_screen.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/profile.dart';
import 'package:wheels_on_lease/src/wallet.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/option_screen_widgets.dart';

class OptionScreen extends StatefulWidget {
  OptionScreen({this.customer});
  final Customer customer;
  OptionScreenState createState() => OptionScreenState(customer: customer);
}

class OptionScreenState extends State<OptionScreen> {
  OptionScreenState({this.customer});
  final Customer customer;
  String data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          decoHeader(
              height: 220.0,
              customerGender: customer.gender,
              customerName: customer.name),
          Flexible(
            child: roundedContainer(
              child: customList(
                widget0: optionTile(
                  text: "Edit Profile",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: Profile(
                            customer: customer,
                            customerEmail: customer.email,
                            isProfileEdit: true,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                widget1: optionTile(
                  text: "My Wallet",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material(
                          child: MaterialApp(
                            debugShowCheckedModeBanner: false,
                            home: Material(
                              color: kGreenColor,
                              child: Wallet(),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                widget2: optionTile(text: "My Statistics"),
                widget3: optionTile(text: "Invite Friends"),
                widget4: optionTile(text: "Support"),
                widget5: optionTile(text: "Settings"),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomLeft,
            child: logOutButton(
              size: 20.0,
              function: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Material(
                      child: AuthInitScreen(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
