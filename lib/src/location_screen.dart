import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wheels_on_lease/src/hide/hide.dart';
import 'package:wheels_on_lease/src/location_vehicles.dart';
import 'package:wheels_on_lease/src/model/location_model.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';
import 'package:wheels_on_lease/src/widgets/home_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/location_screen_widgets.dart';
import 'package:wheels_on_lease/src/widgets/scanRideWidget.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.customer});
  final Customer customer;
  LocationScreenState createState() => LocationScreenState(customer: customer);
}

class LocationScreenState extends State<LocationScreen> {
  LocationScreenState({this.customer});
  final Customer customer;
  List<Location> locationList = [];
  Location location;
  List<Vehicle> vehicles;
  Future<List<Location>> getLocations() async {
    QuerySnapshot snapshot = await locationRecord
        .document('delhi')
        .collection('locations')
        .getDocuments();
    locationList = snapshot.documents
        .map((DocumentSnapshot doc) => Location.fromDocument(doc))
        .toList();
    return locationList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: kButtonGradient,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.purple,
              size: 40.0,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "Locations",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: kPurpleColor),
        ),
      ),
      body: FutureBuilder(
        future: getLocations(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(child: Center(child: Text("Loading...")));
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return locationTile(
                    height: 160.0,
                    imageUrl: snapshot.data[index].imageUrl,
                    locationName: snapshot.data[index].locationName,
                    pincode: snapshot.data[index].pincode,
                    function: () async {
                      location = snapshot.data[index];
                      String _city = customer.city.toLowerCase();
                      QuerySnapshot _snapshot = await vehicleRecord
                          .document('$_city')
                          .collection('$_city' 'Vehicles')
                          .where('location', isEqualTo: location.locationName)
                          .getDocuments();
                      vehicles = _snapshot.documents
                          .map((DocumentSnapshot doc) =>
                              Vehicle.fromDocuments(doc))
                          .toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Material(
                            child: LocationVehicle(
                              location: location,
                              vehicleList: vehicles,
                            ),
                          ),
                        ),
                      );
                    });
              },
            );
          }
        },
      ),
    );
  }
}
