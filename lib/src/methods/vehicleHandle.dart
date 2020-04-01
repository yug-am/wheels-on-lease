import 'package:wheels_on_lease/src/hide/hide.dart';

void addVehicle({
  String vehicleType,
  bool isAvailble,
  int registrationNo,
  String location,
  String imageUrl,
}) async {
  vehicleRecord
      .document('delhi')
      .collection('delhiVehicles')
      .document("$registrationNo")
      .setData(
    {
      "vehicleType": vehicleType,
      "isAvailable": isAvailble,
      "regNo": registrationNo,
      "location": location,
      "imageUrl": imageUrl
    },
  );
  print('success');
}
