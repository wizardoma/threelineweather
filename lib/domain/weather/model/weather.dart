import 'package:threelineweather/domain/weather/model/weather_details.dart';

class Weather {
  final String city;
  final String main;
  final String icon;
  final String description;
  final WeatherDetails details;

  const Weather(
      {required this.city,
      required this.main,
      required this.icon,
      required this.description,
      required this.details});

  factory Weather.fromOpenWeather(dynamic data) {
    return Weather(
      city: data["name"],
      main: data["weather"]["name"],
      icon: data["weather"]["icon"],
      description: data["weather"]["icon"],
      details: WeatherDetails.fromOpenWeather(data),
    );
  }
}
