import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/forecast_model.dart';
import 'package:weather_app/model/weather_model.dart';

import 'ForecastCard.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getMaterialColorForWeatherData(weatherModel.condition),
              getMaterialColorForWeatherData(weatherModel.condition)[300]!,
              getMaterialColorForWeatherData(weatherModel.condition)[100]!,
              getMaterialColorForWeatherData(weatherModel.condition)[50]!,
            ]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 200,
                    child: FittedBox(
                      child: Text(
                        weatherModel.cityName,

                      ),
                    ),
                  ),
                  const Icon(Icons.location_on_outlined,size: 40,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 10),
                child: Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weatherModel.maxTemp.round()}/',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${weatherModel.minTemp.round()}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weatherModel.condition,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Image.network("https:${weatherModel.conditionIcon}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'updated at ${weatherModel.lastUpdate.hour}:${weatherModel.lastUpdate.minute}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Divider(height: 5,thickness: 2,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context,index){
                 return SizedBox(height: 20,);
                },
                shrinkWrap: true,
                itemCount: weatherModel.forecast.length-1,
                  itemBuilder: (context,index){
                    ForecastModel forecast = ForecastModel.fromData(weatherModel.forecast[index+1]);
                    return ForecastCard(forecastModel:forecast);
                  })
            ],
          ),
        ),
      ),
    );
  }
}