import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/location.dart';

dynamic getWeatherData(Uri url) async {
  http.Response res = await http.get(url);

  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  } else {
    print(res.body);
  }
}

dynamic getCityWeather(String city) async {
  Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
      {'q': city, 'appid': '', 'units': 'metric'});
  dynamic data = await getWeatherData(url);
  return data;
}

dynamic getLocationWeather() async {
  Location location = Location();
  await location.getCurrentLocation();

  Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
    'lat': location.latitude.toString(),
    'lon': location.longitude.toString(),
    'appid': '',
    'units': 'metric'
  });
  dynamic data = await getWeatherData(url);
  return data;
}
