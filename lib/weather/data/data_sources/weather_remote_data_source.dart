import 'dart:developer';

import 'package:dio/dio.dart';
import '/core/network/error_message_model.dart';
import '/core/error/exceptions.dart';
import '/core/network/api_constance.dart';
import '/core/utilities/dio_logger.dart';

import '/weather/data/models/weather_model.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<WeatherModel> fetchWeather(String cityName);
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<WeatherModel> fetchWeather(String cityName) async {
    try {
      final result = await DioLogger.getDio().get(
        ApiConstance.baseUrl,
        queryParameters: {
          'q': cityName,
          'appid': ApiConstance.apiKey,
          'units': 'metric',
        },
      );
      return WeatherModel.fromJson(result.data);
    } on DioException catch (e) {
      log('Error is: ${e.response?.data['message'].toString()}' ?? 'Error');
      throw ServerException(
        errorMessageModel: e.response?.data == null
            ? const ErrorMessageModel(
                cod: '404',
                message: 'City not found',
              )
            : ErrorMessageModel.fromJson(e.response!.data),
      );
    }
  }
}
