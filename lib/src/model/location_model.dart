import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  Location({
    this.cityName,
    this.locationName,
    this.pincode,
    this.nearestBusStop,
    this.nearestTrainStn,
    this.imageUrl,
    this.locationLink,
    this.operate24H,
  });
  final String cityName;
  final String locationName;
  final int pincode;
  final String nearestBusStop;
  final String nearestTrainStn;
  final String imageUrl;
  final String locationLink;
  final bool operate24H;
  factory Location.fromDocument(DocumentSnapshot documentSnapshot) {
    return Location(
      cityName: documentSnapshot['cityName'],
      locationName: documentSnapshot['locationName'],
      pincode: documentSnapshot['pincode'],
      nearestBusStop: documentSnapshot['nearestBusStop'],
      nearestTrainStn: documentSnapshot['nearestTrainStn'],
      imageUrl: documentSnapshot['imageUrl'],
      locationLink: documentSnapshot['locationLink'],
      operate24H: documentSnapshot['operate24H'],
    );
  }
}
