import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getMaterialColorForWeatherData(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition)),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getMaterialColorForWeatherData(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.yellow;
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Clear':
      return Colors.lightBlue;
    case 'Overcast':
    case 'Mist':
      return Colors.grey;
    case 'Patchy rain possible':
      return Colors.blueGrey;
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.grey;
    case 'Thundery outbreaks possible':
      return Colors.deepOrange;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
      return Colors.blue;
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.grey;
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Light rain':
      return Colors.blue;
    case 'Moderate rain at times':
      return Colors.blue;
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
      return Colors.blue;
    case 'Heavy rain':
      return Colors.blue;
    case 'Light freezing rain':
      return Colors.grey;
    case 'Moderate or heavy freezing rain':
      return Colors.grey;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light rain shower':
      return Colors.lightBlue;
    case 'Moderate or heavy rain shower':
      return Colors.blue;
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light rain with thunder':
      return Colors.blueGrey;
    case 'Moderate or heavy rain with thunder':
      return Colors.blue;
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.grey;
    default:
      return Colors.grey;
  }
}
