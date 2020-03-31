import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/profile.dart';
import 'package:wheels_on_lease/src/widgets/auth_init_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';

class Signin extends StatefulWidget {
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  FirebaseUser _user;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  userRegister({String email, String pass, BuildContext context}) async {
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
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
                    buttonText: 'Signin',
                    function: () async {
                      if (_formKey.currentState.validate()) {
                        _user = await userRegister(
                            email: _emailController.text,
                            pass: _passController.text,
                            context: context);
                            String userEmail =_user.email;
                        print(_user.email);
                        print('success');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(customerEmail: userEmail,),
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
