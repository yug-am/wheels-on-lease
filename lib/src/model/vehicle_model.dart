import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  String imageUrl;
  String location;
  String vehicleType;
  bool isAvailable;
  int regNo;
  Vehicle({
    this.imageUrl,
    this.location,
    this.vehicleType,
    this.isAvailable,
    this.regNo,
  });
  factory Vehicle.fromDocuments(DocumentSnapshot documentSnapshot) {
    return Vehicle(
      imageUrl: documentSnapshot['imageUrl'],
      location: documentSnapshot['location'],
      vehicleType: documentSnapshot['vehicleType'],
      isAvailable: documentSnapshot['isAvailable'],
      regNo: documentSnapshot['regNo'],
    );
  }
}
