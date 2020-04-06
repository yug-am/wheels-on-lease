import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/widgets/option_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/wallet_widget.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment:new Alignment(x, y)
      children: <Widget>[
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              decoAltHeader(
                  height: 200.0,
                  function: () {
                    Navigator.pop(context);
                  },
                  title: "My Wallet"),
              Expanded(
                child: roundedContainer(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 160.0),
                      ),
                      optionActionLabel(
                        labelText: "Balance ",
                        labelData: "₹ 100.5",
                        function: () => print("tap"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        child: Divider(
                          color: Colors.black,
                          height: 1.0,
                        ),
                      ),
                      optionLabel(
                        labelText: "Payment",
                        function: () => print("tap"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 140.0,
          left: 30.0,
          child: ridePassCard(
            labelData: "₹ 250.0",
            labelText: "Weekly Pass",
            function: () => print("tap"),
          ),
        )
      ],
    );
  }
}
