import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  bool onRide;
  String name;
  String gender;
  String email;
  String age;
  String city;
  String activeRide;
  Customer({
    this.name,
    this.gender,
    this.email,
    this.age,
    this.city,
    this.onRide,
    this.activeRide,
  });
  factory Customer.fromDocument(DocumentSnapshot documentSnapshot) {
    return Customer(
      name: documentSnapshot['name'],
      gender: documentSnapshot['gender'],
      email: documentSnapshot['email'],
      age: documentSnapshot['age'],
      city: documentSnapshot['city'],
      onRide: documentSnapshot['onRide'],
      activeRide:documentSnapshot['activeRide'],
    );
  }
}
