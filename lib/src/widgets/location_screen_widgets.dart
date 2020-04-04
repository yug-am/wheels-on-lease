import 'package:flutter/material.dart';

InkWell locationTile(
    {double height = 16.0, String imageUrl, String locationName, int pincode,Function function}) {
  double size = 20.0;
  return InkWell(
    onTap: function,
    child: SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(
              (height / 10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (height / 20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(height / 20),
                    child: Image.network('$imageUrl',
                        height: height / 1.2,
                        width: height / 1.2,
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (height / 10),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "$locationName \n",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: size,
                      ),
                      children: [
                        TextSpan(
                          text: "$pincode \n",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: size,
                          ),
                          children: [
                            TextSpan(
                              text: "pincode- $pincode",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: size,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
