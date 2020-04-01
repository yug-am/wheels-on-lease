import 'package:flutter/material.dart';

const Color kTransparentColor = Color(0x00000000);

InkWell textButton({bool isActive, Function function, String buttonText}) {
  return InkWell(
    onTap: function,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            buttonText,
            style: isActive
                ? TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 34)
                : TextStyle(color: Colors.black54, fontSize: 24),
          ),
        ),
        SizedBox(
          height: 6,
          width: 60,
          child: Container(
            child: Text(""),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : kTransparentColor,
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
        )
      ],
    ),
  );
}

String emailValidatorFunction(String value) {
  if (value.isEmpty) {
    return 'Please enter some text';
  } else if (!(value.contains("@") || (value.contains(".")))) {
    return 'Please enter valid email';
  }
  return null;
}

String passValidatorFunction(String value) {
  if (value.isEmpty) {
    return 'Please enter some text';
  } else if (value.length < 6) {
    return 'should be greater than 6 characters';
  }
  return null;
}

TextFormField userField({
  @required String labelText,
  @required String hintText,
  bool isObscure = false,
  @required TextEditingController textEditingController,
  Function validatorFunction,
  TextInputType keyboardType = TextInputType.emailAddress,
}) {
  return TextFormField(
    //controller: textEditingController,
    validator: (String value) => validatorFunction(value),
    controller: textEditingController,
    obscureText: isObscure,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 20.0),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 20.0),
    ),
  );
}
