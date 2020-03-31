import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String name;
  String gender;
  String email;
  String age;
  String city;
  Customer({
    this.name,
    this.gender,
    this.email,
    this.age,
    this.city,
  });
  factory Customer.fromDocument(DocumentSnapshot documentSnapshot) {
    return Customer(
      name: documentSnapshot['name'],
      gender: documentSnapshot['gender'],
      email: documentSnapshot['email'],
      age: documentSnapshot['age'],
      city: documentSnapshot['city'],
    );
  }
}