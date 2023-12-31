import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String base_Url = 'https://api.weatherapi.com/v1/forecast.json';
  final String apiKey = 'd4efc45c82f04223b8b224145231912';

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      Response response = await dio
          .get('$base_Url?key=$apiKey&q=$cityName&days=6&aqi=no&alerts=yes}');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          "OOPs there is an error try again later";
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception("Try again later");
    }
  }
}
