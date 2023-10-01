import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app_colors_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      /// Main Colors used in the app
      primaryColor: AppColorsLight.primary,
      primaryColorDark: AppColorsLight.primaryDark,
      primaryColorLight: AppColorsLight.primaryLight,
      scaffoldBackgroundColor: AppColorsLight.background,

      /// ButtonThemeData is used to configure the default property of the button widgets.
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColorsLight.button,
        textTheme: ButtonTextTheme.primary,
      ),

      ///Text Form Field Theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1.h),
          ),
          borderSide: BorderSide(
            color: AppColorsLight.primary,
            width: 0.5.h,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1.h),
          ),
          borderSide: BorderSide(
            color: AppColorsLight.primary,
            width: 0.3.h,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(1.h),
          ),
          borderSide: BorderSide(
            color: AppColorsLight.error,
            width: 0.5.h,
          ),
        ),
      ),

      /// AppBar Theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 8,
        backgroundColor: AppColorsLight.primaryDark,
      ), colorScheme: const ColorScheme.light(
        primary: AppColorsLight.primary,
        background: AppColorsLight.background,
        error: AppColorsLight.error,
        brightness: Brightness.light,
      ).copyWith(error: AppColorsLight.error),
    );
