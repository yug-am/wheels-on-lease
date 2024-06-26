import 'dart:convert';
import 'package:http/http.dart' as http;
import '../hide/hide.dart';

String api = apiKey;
Future<List<String>> currentWeather({String cityName = "Delhi"}) async {
  List<String> weatherData = ["30", "cloudy", "clouds"];
  http.Response httpResponse;

  httpResponse = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$api');
  if (httpResponse.statusCode == 200) {
    String rawJson = httpResponse.body;
    Map<String, dynamic> weatherMap = await jsonDecode(rawJson);
    String temp = (((weatherMap['main']['temp']) - 273.15).round()).toString();
    String weatherStatus = weatherMap["weather"][0]["main"];
    String cod = weatherMap["weather"][0]["icon"];
    weatherData = [temp, weatherStatus, cod];
  } else {
    print("e");
  }
  return weatherData;
}

String weatherIcon(int code) {
  if (200 <= code && code <= 232) {
    return "thunderstorm";
  } else if (300 <= code && code <= 321) {
    return "drizzle";
  } else if (500 <= code && code <= 531) {
    return "rain";
  } else if (701 <= code && code <= 781) {
    return "wind";
  } else if (code == 800) {
    return "clear";
  } else if (801 <= code && code <= 804) {
    return "clouds";
  } else {
    return "dunno";
  }
}
