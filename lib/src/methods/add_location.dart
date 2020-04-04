//locationRecord
import 'package:wheels_on_lease/src/hide/hide.dart';

void addLocation({
  String locationName,
  int pincode,
  String nearestBusStop,
  String nearestTrainStn,
  String imageUrl,
  String locationLink,
  bool operate24H,
  String cityName,
}) async {
  locationRecord
      .document('$cityName')
      .collection('locations')
      .document('$locationName')
      .setData(
    {
      "locationName": locationName,
      "pincode": pincode,
      "nearestBusStop": nearestBusStop,
      "nearestTrainStn": nearestTrainStn,
      "imageUrl": imageUrl,
      "locationLink": locationLink,
      "operate24H": operate24H,
    },
  );
}

// addLocation(
//       locationName: "xyz",
//       pincode: 1234,
//       nearestBusStop: "bus stop 2",
//       nearestTrainStn: "34",
//       imageUrl: egURL,
//       locationLink: "www.link.com",
//       operate24H: true,
//     );
