import 'package:get_it/get_it.dart';
import '/weather/presentation/manager/weather_controller.dart';

import '/weather/data/data_sources/weather_remote_data_source.dart';
import '/weather/data/repositories/weather_repository.dart';
import '/weather/domain/repositories/base_weather_repository.dart';
import '/weather/domain/use_cases/get_weather_by_city_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Providers
    sl.registerFactory(() => WeatherController());

    /// Use Cases
    sl.registerLazySingleton(() => GetWeatherByCityUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseWeatherRepository>(
        () => WeatherRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseWeatherRemoteDataSource>(
        () => WeatherRemoteDataSource());
  }
}
