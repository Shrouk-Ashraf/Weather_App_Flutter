
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import '../../model/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(NoWeatherState());

  WeatherModel? weatherModel;

  getCurrentWeather(String cityName)async{
    try {
      emit(WeatherIsLoadingState());
      weatherModel = await WeatherService(
          dio: Dio()).getCurrentWeather(cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(error: e.toString()));
    }

  }

}