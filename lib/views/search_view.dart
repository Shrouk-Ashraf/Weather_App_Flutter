
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';


class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? condition = BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              getMaterialColorForWeatherData(condition)[200]!,
              Colors.white,
              getMaterialColorForWeatherData(condition)[200]!,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getCurrentWeather(value);
                Navigator.pop(context);
                },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.orangeAccent)
                ),
                labelText: "Search",
                suffixIcon: const Icon(Icons.search,color: Colors.black,),
                contentPadding: const EdgeInsets.symmetric(vertical: 18,horizontal: 8)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
