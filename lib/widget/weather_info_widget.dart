import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    /* WeatherModel weatherModel = BlocProvider.of<GetWeatherCubits>(context).weatherModel!; */
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getConditionColor(weatherModel.weatherCondtion),
            getConditionColor(
              weatherModel.weatherCondtion,
            )[300]!,
            getConditionColor(
              weatherModel.weatherCondtion,
            )[200]!,
            getConditionColor(
              weatherModel.weatherCondtion,
            )[100]!,
            getConditionColor(
              weatherModel.weatherCondtion,
            )[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              'Last Updeted ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: NetworkImage(
                      'https:${weatherModel.image}',
                    ),
                  ),
                  Text(
                    weatherModel.currentTem.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'MaxTem: ${weatherModel.maxTem.round()}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'MinTem: ${weatherModel.minTem.round()}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              weatherModel.weatherCondtion,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
