import 'package:client/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.whiteSmoke,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: _appBarTheme(),
        searchBarTheme: SearchBarThemeData(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            AppColors.deepNavyBlue.withOpacity(0.1),
          ),
        ),
        primaryColor: AppColors.violetBlue,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: AppColors.violetBlue),
      );

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
        backgroundColor: AppColors.whiteSmoke,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.violetBlue,
          systemNavigationBarIconBrightness: Brightness.light,
        ));
  }
}
