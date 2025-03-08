import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';
// import 'package:weather_app/widget/no_weather_widget.dart';
import 'package:weather_app/widget/weather_info_widget.dart';
// import 'package:weather_app/widget/weather_info_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
      body: WeatherInfoWidget(),
    );
  }
}
