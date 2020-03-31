import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/methods/dateTime.dart';
import 'package:wheels_on_lease/src/search.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';

import 'map_screen.dart';
import 'methods/weather.dart';
import 'model/user_data_model.dart';

class MainScreen extends StatefulWidget {
  Customer customer;
  MainScreen({this.customer});
  MainScreenState createState() => MainScreenState(customer: customer);
}

class MainScreenState extends State<MainScreen> {
   Customer customer;
  MainScreenState({this.customer});
  String x;
  String date;
  bool refreshed;
  List<String> weatherData;
  //String cityName ;
  //String sampleDpUrl = "https://i.picsum.photos/id/336/200/200.jpg";
  fetchWeatherData() async {
    weatherData = await currentWeather(cityName: customer.city);
    print("x");
  }

  @override
  void initState() {
    date = getDateTime();
    fetchWeatherData();
    print(weatherData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    refreshWeatherWidget(weatherData){
      setState(() {
        refreshed =true;
      });
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: kLinearGradient),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    customAvatar(radius: 50.0, gender:customer.gender),
                    searchIcon(
                      size: 30.0,
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                mainTextColumn(
                  heading: customHeadText(
                    username: "${customer.name}"),
                    //username: "test"),
                  subText: customText(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                customDateTempStack(
                  date: date,
                  //{"widgets render first and data later, Need to fix this issue",}
                  // temp: weatherData[0],
                  // status: weatherData[1],
                  // icon: weatherData[2],
                  temp: "28",
                  status: "Clouds",
                  icon: "thunderstorm",
                  cityName: customer.city,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: browseText(function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );
                      },
                    ),
                ),
                vehicleCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
