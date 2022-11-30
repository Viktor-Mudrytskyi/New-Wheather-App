import 'dart:convert';
import 'dart:developer';
import 'package:weather_app/models/wheather_model/wheather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/location.dart';

class WheatherApi {
  static Future<Forecast> fetchForecast(String cityName) async {
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=$cityName&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric');
    var response = await http.get(uri);
    log('Fetching data');
    if (response.statusCode == 200) {
      log('Data fetched!!');
      return Forecast.fromJson(jsonDecode(response.body));
      
    } else {
      throw Exception('Not found');
    }
  }
  static Future<Forecast> fetchForecastLonLat() async {
    final location=Location();
    await location.getCurrentLoc();
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast/daily?lat=${location.lat}&lon=${location.lon}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric');
    var response = await http.get(uri);
    log('Fetching data');
    if (response.statusCode == 200) {
      log('Data fetched!!');
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Not found by location');
    }
  }
}
