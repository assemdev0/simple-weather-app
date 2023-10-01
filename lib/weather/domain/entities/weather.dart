import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final String icon;
  final String description;
  final String main;

  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.icon,
    required this.main,
    required this.description,
  });

  @override
  List<Object?> get props => [
        cityName,
        temperatureCelsius,
        icon,
        description,
        main,
      ];
}
