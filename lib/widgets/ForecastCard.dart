import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast_model.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key, required this.forecastModel}) : super(key: key);

  final ForecastModel forecastModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(forecastModel.date),
        Image.network("https:${forecastModel.icon}",),
        Row(
          children: [
            Text(forecastModel.max_temp.round().toString()),
            const Text('/'),
            Text(forecastModel.min_temp.round().toString()),
          ],
        )
      ],
    ) ;
  }
}
