import 'dart:developer';

import 'package:flutter/material.dart';
import '/core/utilities/enums.dart';
import '/weather/domain/use_cases/get_weather_by_city_usecase.dart';

import '../../../core/services/services_locator.dart';
import '../../domain/entities/weather.dart';

class WeatherController with ChangeNotifier {
  RequestState requestState = RequestState.empty;
  String errorMessage = '';
  Weather? weather;
  GetWeatherByCityUseCase getWeatherByCityUseCase = sl();
  TextEditingController cityController = TextEditingController();

  Future<void> getWeatherByCity() async {
    requestState = RequestState.loading;
    notifyListeners();
    final response = await getWeatherByCityUseCase(cityController.text);
    response.fold(
      (failure) {
        log('Message: ${failure.message}');
        errorMessage = failure.message;
        requestState = RequestState.error;
        notifyListeners();
      },
      (weather) {
        this.weather = weather;
        requestState = RequestState.loaded;
        log(weather.toString());
        notifyListeners();
      },
    );
  }
}
