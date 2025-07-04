import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubits/get_weather_cubits.dart';
import 'package:weather_app/cubits/git_weather_cubits/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

// flutter build web --release && firebase init hosting && firebase deploy --only hosting -m 'V 1.0.0'
// firebase deploy --only hosting -m ' V 1.0.1'
//flutter build web --release && firebase deploy --only hosting -m 'V 1.0.1'
void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubits(),
      child: Builder(
        builder:
            (context) => BlocBuilder<
              GetWeatherCubits,
              WeatherState
            >(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
                      backgroundColor: getConditionColor(
                        BlocProvider.of<GetWeatherCubits>(
                                  context,
                                )
                                .weatherModel
                                ?.weatherCondtion ??
                            "null",
                      ),
                    ),
                    
                  ),
                  home: HomeView(),
                );
              },
            ),
      ),
    );
  }
}

MaterialColor getConditionColor(String condition) {
  // ignore: unnecessary_null_comparison
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Patchy light rain':
      return Colors.lightBlue;
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
      return Colors.cyan;
    case 'Patchy sleet possible':
    case 'Patchy rain nearby':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.indigo;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Blizzard':
      return Colors.grey;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;
    case 'Freezing fog':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
      return Colors.lightBlue;
    default:
      return Colors.grey;
  }
}
