import 'package:wheels_on_lease/src/hide/hide.dart';
import 'package:wheels_on_lease/src/model/ride_model.dart';
import 'package:wheels_on_lease/src/model/user_data_model.dart';
import 'package:wheels_on_lease/src/model/vehicle_model.dart';

createRideRecordStart(
    {String rideId,
    String timeStampStart,
    Vehicle vehicle,
    Customer customer}) async {
  String city = customer.city.toLowerCase();
  await rideRecord
      .document(customer.email)
      .collection("rides")
      .document(rideId)
      .setData({
    "rideId": rideId,
    "prob": false,
    "imageUrl": vehicle.imageUrl,
    "location": vehicle.location,
    "regNo": vehicle.regNo,
    "vehicleType": vehicle.vehicleType,
    "timeStart": timeStampStart,
    "timeEnd": timeStampStart,
    "isActive": true,
    "probS": "nil",
  });
  await userRecord.document(customer.email).setData(
    {
      "name": customer.name,
      "gender": customer.gender,
      "age": customer.age,
      "city": customer.city,
      "email": customer.email,
      "onRide": true,
      "activeRide": rideId,
    },
  );
  await vehicleRecord
      .document('$city')
      .collection('$city' 'Vehicles')
      .document("${vehicle.regNo}")
      .setData(
    {
      "vehicleType": vehicle.vehicleType,
      "isAvailable": false,
      "regNo": vehicle.regNo,
      "location": vehicle.location,
      "imageUrl": vehicle.imageUrl,
    },
  );
}

createRideRecordEnd(
    {String timeStampEnd,
    Vehicle vehicle,
    Customer customer,
    Ride ride}) async {
  String city = customer.city.toLowerCase();
  await rideRecord
      .document(customer.email)
      .collection("rides")
      .document('${ride.rideId}')
      .setData({
    "rideId": ride.rideId,
    "prob": false,
    "imageUrl": ride.imageUrl,
    "location": vehicle.location,
    "regNo": ride.regNo,
    "vehicleType": ride.vehicleType,
    "timeStart": ride.timeStart,
    "timeEnd": timeStampEnd,
    "isActive": false,
    "probS": "nil",
  });
  await userRecord.document(customer.email).setData(
    {
      "name": customer.name,
      "gender": customer.gender,
      "age": customer.age,
      "city": customer.city,
      "email": customer.email,
      "onRide": false,
      "activeRide": "nil",
    },
  );
  await vehicleRecord
      .document('$city')
      .collection('$city' 'Vehicles')
      .document("${vehicle.regNo}")
      .setData(
    {
      "vehicleType": vehicle.vehicleType,
      "isAvailable": true,
      "regNo": vehicle.regNo,
      "location": vehicle.location,
      "imageUrl": vehicle.imageUrl,
    },
  );
}

createRideRecordEndProb(
    {String timeStampEnd,
    Vehicle vehicle,
    Customer customer,
    Ride ride,
    String probS}) async {
  String city = customer.city.toLowerCase();
  await rideRecord
      .document(customer.email)
      .collection("rides")
      .document('${ride.rideId}')
      .setData({
    "rideId": ride.rideId,
    "prob": true,
    "imageUrl": ride.imageUrl,
    "location": vehicle.location,
    "regNo": ride.regNo,
    "vehicleType": ride.vehicleType,
    "timeStart": ride.timeStart,
    "timeEnd": timeStampEnd,
    "isActive": false,
    "probS": probS,
  });
  await userRecord.document(customer.email).setData(
    {
      "name": customer.name,
      "gender": customer.gender,
      "age": customer.age,
      "city": customer.city,
      "email": customer.email,
      "onRide": false,
      "activeRide": "nil",
    },
  );
  await vehicleRecord
      .document('$city')
      .collection('$city' 'Vehicles')
      .document("${vehicle.regNo}")
      .setData(
    {
      "vehicleType": vehicle.vehicleType,
      "isAvailable": true,
      "regNo": vehicle.regNo,
      "location": vehicle.location,
      "imageUrl": vehicle.imageUrl,
    },
  );
}
