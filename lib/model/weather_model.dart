
import 'dart:ffi';

class WeatherModel{
  final String cityName;
  final DateTime lastUpdate;
  final double temp;
  final String condition;
  final String conditionIcon;
  final double maxTemp;
  final double minTemp;

  WeatherModel({required this.cityName, required this.lastUpdate,
  required this.temp, required this.condition, required this.conditionIcon,
  required this.maxTemp, required this.minTemp});

  factory WeatherModel.fromJson(json){
    return WeatherModel(cityName: json['location']['name'],
              lastUpdate: DateTime.parse( json['current']['last_updated']),
              temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
              maxTemp:  json['forecast']['forecastday'][0]['day']['maxtemp_c'],
              minTemp:  json['forecast']['forecastday'][0]['day']['mintemp_c'],
              condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
              conditionIcon: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}