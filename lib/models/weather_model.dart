class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double currentTem;
  final double maxTem;
  final double minTem;
  final String weatherConftion;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.currentTem,
    required this.maxTem,
    required this.minTem,
    required this.weatherConftion,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      image: json['current']['condition']['icon'],
      currentTem: json['current']['temp_c'],
      maxTem:
          json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTem:
          json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherConftion:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
