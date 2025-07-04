import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubits/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubits extends Cubit<WeatherState> {
  WeatherModel? weatherModel;
  GetWeatherCubits() : super(WeatherInitialState());

  getWeather({required cityName}) async {
    try {
      weatherModel = await WeatherService()
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
