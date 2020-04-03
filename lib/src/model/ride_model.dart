import 'package:cloud_firestore/cloud_firestore.dart';

class Ride {
  bool isActive;
  String rideId;
  String imageUrl;
  String location;
  int regNo;
  String vehicleType;
  String timeStart;
  String timeEnd;
  bool prob;
  String probS;
  Ride({
    this.rideId,
    this.prob,
    this.imageUrl,
    this.location,
    this.regNo,
    this.vehicleType,
    this.timeStart,
    this.isActive,
    this.timeEnd,
    this.probS,
  });
  factory Ride.fromDocument(DocumentSnapshot documentSnapshot) {
    return Ride(
      rideId: documentSnapshot['rideId'],
      probS: documentSnapshot['probS'],
      prob: documentSnapshot['prob'],
      imageUrl: documentSnapshot['imageUrl'],
      location: documentSnapshot['location'],
      regNo: documentSnapshot['regNo'],
      vehicleType: documentSnapshot['vehicleType'],
      timeStart: documentSnapshot['timeStart'],
      isActive: documentSnapshot['isActive'],
      timeEnd: documentSnapshot['timeEnd'],
    );
  }
}
