import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../manager/weather_controller.dart';

class WeatherLoadedWidget extends StatelessWidget {
  const WeatherLoadedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              context.watch<WeatherController>().weather?.icon ?? '',
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
            Text(
              context
                      .read<WeatherController>()
                      .weather
                      ?.cityName
                      .toUpperCase() ??
                  '',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              '${context.read<WeatherController>().weather?.temperatureCelsius ?? ''}°C',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              context.read<WeatherController>().weather?.main ?? '',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              context.read<WeatherController>().weather?.description ?? '',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
