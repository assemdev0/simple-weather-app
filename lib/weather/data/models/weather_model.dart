import '/weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.cityName,
    required super.temperatureCelsius,
    required super.icon,
    required super.description,
    required super.main,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperatureCelsius: json['main']['temp'].toDouble(),
      icon: "http://openweathermap.org/img/w/${json['weather'][0]['icon']}.png",
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
    );
  }
}
