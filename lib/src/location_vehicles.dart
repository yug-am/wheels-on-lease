import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/location_vehicle_widgets.dart';
import 'model/location_model.dart';

class LocationVehicle extends StatefulWidget {
  LocationVehicle({this.location, this.vehicleList});
  final Location location;
  final List<Vehicle> vehicleList;
  LocationVehicleState createState() =>
      LocationVehicleState(location: location, vehicleList: vehicleList);
}

class LocationVehicleState extends State<LocationVehicle> {
  LocationVehicleState({this.location, this.vehicleList});
  final List<Vehicle> vehicleList;
  final Location location;
  List<GridTile> gridTile;
  @override
  void initState() {
    gridTile = [];
    vehicleList.forEach((vehicle) {
      gridTile.add(
        GridTile(
          child: customVehicleCardLocation(
              vehicleType: vehicle.vehicleType,
              isAvailable: vehicle.isAvailable,
              imageUrl: vehicle.imageUrl,
              location: vehicle.location),
        ),
      );
    });
    super.initState();
  }

  double height = 300.0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          locationVehicleTop(
            imageLink: location.imageUrl,
            height: height,
            infoRow1: locationInfoRow(
              height: (height / 3),
              palet1: miniInfoPalet(
                  data: location.nearestBusStop, label: "Bus Stop"),
              palet2: miniInfoPalet(
                  data: location.nearestTrainStn, label: "Train Station"),
              palet3: miniInfoPalet(
                  data: location.pincode.toString(), label: "Pincode"),
            ),
            infoRow2:
                locationLink(height: height / 4, link: location.locationLink),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              color: kPurpleColor,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.5,
                shrinkWrap: true,
                // scrollDirection: ScrollDirec,
                physics: NeverScrollableScrollPhysics(),
                children: gridTile,
              ),
            ),
          )
        ],
      ),
    );
  }
}
