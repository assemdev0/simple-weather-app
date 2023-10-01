import 'dart:developer';

import 'package:dartz/dartz.dart';
import '/core/error/failures.dart';
import '/weather/data/data_sources/weather_remote_data_source.dart';
import '/weather/domain/entities/weather.dart';
import '/weather/domain/repositories/base_weather_repository.dart';

import '../../../core/error/exceptions.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseWeatherRemoteDataSource _baseWeatherRemoteDataSource;

  WeatherRepository(this._baseWeatherRemoteDataSource);
  @override
  Future<Either<Failure, Weather>> fetchWeather(String cityName) async {
    try {
      final result = await _baseWeatherRemoteDataSource.fetchWeather(cityName);

      return Right(result);
    } on ServerException catch (e) {
      log(e.errorMessageModel.message);
      return Left(
        ServerFailure(e.errorMessageModel.message),
      );
    }
  }
}
