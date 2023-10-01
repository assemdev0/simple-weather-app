import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '/core/utilities/enums.dart';
import '/weather/presentation/manager/weather_controller.dart';
import '/weather/presentation/widgets/weather_loaded_w_idget.dart';

import '../../../core/utilities/app_strings.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.weatherScreen),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Column(
          children: [
            TextFormField(
              controller: context.watch<WeatherController>().cityController,
              decoration: const InputDecoration(
                hintText: AppStrings.searchHint,
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 2.h),
            MaterialButton(
              onPressed: () {
                context.read<WeatherController>().getWeatherByCity();
              },
              minWidth: 70.w,
              height: 6.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h),
              ),
              color: Theme.of(context).primaryColorDark,
              child: const Text(AppStrings.searchButton),
            ),
            SizedBox(height: 2.5.h),
            if (context.watch<WeatherController>().requestState ==
                RequestState.loading)
              Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: Theme.of(context).primaryColorDark,
                    size: 10.w,
                    itemCount: 10,
                    duration: const Duration(milliseconds: 1500),
                  ),
                ),
              )
            else if (context.watch<WeatherController>().requestState ==
                RequestState.loaded)
              const WeatherLoadedWidget()
            else if (context.watch<WeatherController>().requestState ==
                RequestState.error)
              Expanded(
                child: Center(
                  child: Text(
                    context.watch<WeatherController>().errorMessage,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
