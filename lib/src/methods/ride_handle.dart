
import 'package:wheels_on_lease/src/hide/hide.dart';

void addRide({
  String userEmail,
  String vehicleType,
  String timeStart,
  String timeEnd,
  String date,
  int registrationNo,
  String location,
  String imageUrl,
}) async {
  vehicleRecord
      .document('$userEmail')
      .collection('rides')
      .document("")
      .setData(
    {
      "vehicleType": vehicleType,
      "startTime":timeStart,
      "endTime":timeEnd,
      "date":date,
      "regNo": registrationNo,
      "location": location,
      "imageUrl": imageUrl
    },
  );
}