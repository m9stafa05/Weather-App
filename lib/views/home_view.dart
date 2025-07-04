import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubits/get_weather_cubits.dart';
import 'package:weather_app/cubits/git_weather_cubits/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/no_weather_widget.dart';
import 'package:weather_app/widget/weather_info_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubits, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherWidget();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoWidget(
              weatherModel: state.weatherModel,
            );
          } else {
            return Center(
              child: const Text(
                'Opps , There Was An Error',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
