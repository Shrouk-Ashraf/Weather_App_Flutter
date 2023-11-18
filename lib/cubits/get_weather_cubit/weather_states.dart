import '../../model/weather_model.dart';

class WeatherState{}

class NoWeatherState extends WeatherState{}

class WeatherSuccessState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState{
  final String error;
  WeatherFailureState({required this.error});
}
class WeatherIsLoadingState extends WeatherState{

}