import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

// http://api.weatherapi.com/v1/forecast.json?key=2f7e7e6563ae4586914130803250803&q=$cairo&days=1
class WeatherService {
  final Dio dio = Dio();
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '2f7e7e6563ae4586914130803250803';
  WeatherService();

  Future<WeatherModel> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(
        response.data,
      );
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'Opps There was An Error , Please Try Latter';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(
        'Opps There was An Error , Please Try Latter',
      );
    }
  }
}
