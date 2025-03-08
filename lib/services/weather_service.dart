import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  WeatherService();

  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json?key=2f7e7e6563ae4586914130803250803&q=$cityName&days=1',
    );
    Map<String, dynamic> jsondata = response.data;
    WeatherModel weatherModel =
        WeatherModel.fromJson(jsondata);
    return weatherModel;
  }
}
