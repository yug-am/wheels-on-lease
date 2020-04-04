import 'package:flutter/material.dart';

import 'home_screen_widgets.dart';

TextStyle textStyleHeadline() {
  return TextStyle(
      color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);
}

List<String> users = ['Male', 'Female'];
String nameValidatorFunction(String value) {
  if (value.isEmpty) {
    return 'Please enter some text';
  } else if (value.length < 2) {
    return 'should be greater than 3 characters';
  } else if (value.length > 9) {
    return 'should be less than  characters';
  }
  return null;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

String ageValidatorFunction(String value) {
  int valueInt = 11;

  if (!isNumeric(value)) {
    return 'should be non decimal no.';
  } else {
    valueInt = int.parse(value);
  }

  if (valueInt < 10) {
    return 'should be atleast 10 years old';
  }
  return null;
}

Expanded customGenderButton(
    {@required String buttonGender,
    @required String currentGender,
    Function function}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: (buttonGender == currentGender) ? Colors.black : kGreenColor,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(15.0), 
          color: kGreenColor,
        ),
        child: InkWell(
          onTap: function,
          child: Column(children: <Widget>[
            Image.asset(
              'assets/gender/$buttonGender.png',
              height: 100.0,
              width: 120.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),
            Text(
              "$buttonGender",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: (buttonGender == currentGender)
                      ? FontWeight.bold
                      : FontWeight.w400),
            ),
          ]),
        ),
      ),
    ),
  );
}

Theme customDropDownButton(
    {BuildContext context,
    List<String> dropDownList,
    Function function,
    String selected}) {
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: kBlueColor,
    ),
    child: DropdownButton<String>(
        value: selected,
        items: dropDownList.map(
          (String dropDownItem) {
            return DropdownMenuItem<String>(
              value: dropDownItem,
              child: Text(dropDownItem),
            );
          },
        ).toList(),
        onChanged: function),
  );
}
