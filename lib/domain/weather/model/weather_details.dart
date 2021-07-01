class WeatherDetails {
  final double temperature;
  final double pressure;
  final double wind;
  final double humidity;
  final double feelsLike;
  final double uvIndex;

  const WeatherDetails(
      {required this.temperature,
      required this.pressure,
      required this.wind,
      required this.humidity,
      required this.feelsLike,
      required this.uvIndex});

  factory WeatherDetails.fromOpenWeather(dynamic data) {
    return WeatherDetails(
      temperature: data["main"]["temp"],
      pressure: data["main"]["pressure"],
      wind: data["wind"]["speed"],
      humidity: data["main"]["humidity"],
      feelsLike: data["main"]["feels_like"] ?? data["main"]["temp"],
      uvIndex: data["cloud"]["all"],
    );
  }
}
