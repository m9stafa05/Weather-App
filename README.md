# Weather App

A Flutter application that displays the current weather for any city using the [WeatherAPI](https://www.weatherapi.com/). Built with Flutter and Bloc/Cubit state management.

## Features

- Search for weather by city name
- Displays:
  - City name
  - Last updated time
  - Weather condition (with icon)
  - Current temperature
  - Max/Min temperature
- Dynamic background color based on weather condition
- Error handling for invalid city names or network issues
- Responsive UI for mobile and web

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A free API key from [WeatherAPI](https://www.weatherapi.com/)

## Usage

- On launch, search for a city using the search icon in the top right.
- View the current weather, temperature, and condition for the selected city.
- The background color changes based on the weather condition.

## State Management

This app uses [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management with Cubit.

## Assets

- Custom weather icons are located in `assets/images/`.

## Dependencies

- [dio](https://pub.dev/packages/dio) for HTTP requests
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management

## License

This project is licensed under the MIT License.

## Credits

- Weather data provided by [WeatherAPI](https://www.weatherapi.com/)
- Built with [Flutter](https://flutter.dev/)
