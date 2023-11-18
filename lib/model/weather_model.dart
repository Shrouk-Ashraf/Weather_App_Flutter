

class WeatherModel{
  final String cityName;
  final DateTime lastUpdate;
  final double temp;
  final String condition;
  final String conditionIcon;
  final double maxTemp;
  final double minTemp;
  final List<dynamic> forecast;


  WeatherModel({required this.cityName, required this.lastUpdate,
  required this.temp, required this.condition, required this.conditionIcon,
  required this.maxTemp, required this.minTemp,required this.forecast});

  factory WeatherModel.fromJson(json){

    return WeatherModel(cityName: json['location']['country'],
              lastUpdate: DateTime.parse( json['current']['last_updated']),
              temp: json['current']['temp_c'],
              maxTemp:  json['forecast']['forecastday'][0]['day']['maxtemp_c'],
              minTemp:  json['forecast']['forecastday'][0]['day']['mintemp_c'],
              condition: json['current']['condition']['text'],
              conditionIcon: json['current']['condition']['icon'],
              forecast:  json['forecast']['forecastday']);
  }
}