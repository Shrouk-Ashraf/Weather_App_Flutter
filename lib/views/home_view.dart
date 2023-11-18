import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/circular_indicator.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context){
                      return SearchView();
            }
            )
            );
          }, icon: Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context, state) {
          if(state is NoWeatherState){
            return NoWeatherBody();
          }else if(state is WeatherIsLoadingState){
           return CircularIndicator();
          }else if( state is WeatherSuccessState){
            return WeatherInfoBody(weatherModel: state.weatherModel,);
          }else if(state is WeatherFailureState){
            return Center(child: Text(state.error));
          }else{
            return const Center(child:  Text("OOPs, There is an error, Try again later"),);
          }
      },

      ),
    );
  }
}
