import 'package:client/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.whiteSmoke,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.whiteSmoke,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            systemNavigationBarColor: AppColors.violetBlue,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        ),
        primaryColor: AppColors.violetBlue,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.violetBlue),
      );
}
