import 'package:dartz/dartz.dart';
import '/weather/domain/repositories/base_weather_repository.dart';
import '/core/error/failures.dart';
import '/core/usecase/base_usecase.dart';
import '/weather/domain/entities/weather.dart';

class GetWeatherByCityUseCase extends BaseUseCase<Weather, String> {
  final BaseWeatherRepository _baseWeatherRepository;

  GetWeatherByCityUseCase(this._baseWeatherRepository);
  @override
  Future<Either<Failure, Weather>> call(String params) {
    return _baseWeatherRepository.fetchWeather(params);
  }
}
