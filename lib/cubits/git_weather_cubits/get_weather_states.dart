import 'package:weather_app/models/weather_model.dart';

sealed class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState(String string);
}
