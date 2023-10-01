import 'package:flutter/material.dart';
import '/weather/presentation/manager/weather_controller.dart';
import '/core/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/global/theme/theme_data/theme_data_light.dart';
import 'core/services/services_locator.dart';
import 'weather/presentation/screens/weather_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ChangeNotifierProvider(
          create: (BuildContext context) {
            return sl<WeatherController>();
          },
          child: MaterialApp(
            theme: getThemeDataLight(),
            title: AppStrings.appName,
            home: const WeatherScreen(),
          ),
        );
      },
    );
  }
}
