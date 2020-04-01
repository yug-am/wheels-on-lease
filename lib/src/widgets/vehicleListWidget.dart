import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/hide/hide.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
//import 'package:wheels_on_lease/src/widgets/main_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/vehicle_card.dart';

//import 'model/vehicle_model.dart';

class VehicleListWidget extends StatefulWidget {
  VehicleListWidget({this.cityName});
  final String cityName;
  VehicleListWidgetState createState() =>
      VehicleListWidgetState(cityName: cityName);
}

class VehicleListWidgetState extends State<VehicleListWidget> {
  List<Vehicle> vehicleList = [];
  String cityName;
  VehicleListWidgetState({this.cityName});
  var x;
  String testUrl = "https://i.picsum.photos/id/304/200/200.jpg";

  Future<List<Vehicle>> getVehicles({String cityName}) async {
    //print(cityName);
    String _city = cityName.toLowerCase();
    // print('$_city''Vehicles');
    QuerySnapshot snapshot = await vehicleRecord
        .document('$_city')
        .collection('$_city' 'Vehicles')
        .getDocuments();
    vehicleList = snapshot.documents
        .map((DocumentSnapshot doc) => Vehicle.fromDocuments(doc))
        .toList();
    // print(vehicleList.length);
    //print(vehicleList[0].location);
    return vehicleList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getVehicles(cityName: cityName),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.data == null) {
            return Container(child: Center(child: Text("Loading...")));
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return customVehicleCard(
                    imageUrl: snapshot.data[index].imageUrl,
                    isAvailable: snapshot.data[index].isAvailable,
                    location: snapshot.data[index].location,
                    vehicleType: snapshot.data[index].vehicleType);
              },
            );
          }
        },
      ),
    );
  }
}
