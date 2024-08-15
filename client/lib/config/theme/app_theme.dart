import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

String? googleFont = GoogleFonts.montserrat().fontFamily;

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.whiteSmoke,
      fontFamily: googleFont,
      appBarTheme: _appBarTheme(context),
      searchBarTheme: _searchBarTheme(context),
      iconTheme: const IconThemeData(color: AppColors.black),
      textTheme: _textTheme(),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(context),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.softMint,
        backgroundColor: AppColors.whiteSmoke,
        cardColor: AppColors.violetBlue,
        errorColor: AppColors.red,
        primarySwatch: AppColors.violetBlue.materialColor,
      ),
    );
  }

  static TextTheme _textTheme() => const TextTheme().copyWith(
      displayLarge: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      displayMedium: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      displaySmall: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      headlineLarge: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      headlineMedium: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      headlineSmall: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      titleLarge: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      titleMedium: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      titleSmall: TextStyle(
        color: AppColors.deepNavyBlue,
        fontFamily: googleFont,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontFamily: googleFont,
      ),
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontFamily: googleFont,
      ),
      bodySmall: TextStyle(
        color: AppColors.black,
        fontFamily: googleFont,
      ),
      labelLarge: TextStyle(
        color: AppColors.softMint,
        fontFamily: googleFont,
      ),
      labelMedium: TextStyle(
        color: AppColors.softMint,
        fontFamily: googleFont,
      ),
      labelSmall: TextStyle(
        color: AppColors.softMint,
        fontFamily: googleFont,
      ));

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(
      BuildContext context) {
    return const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.whiteSmoke,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ));
  }

  static SearchBarThemeData _searchBarTheme(BuildContext context) {
    return SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(
        AppColors.deepNavyBlue.withOpacity(0.1),
      ),
    );
  }

  static AppBarTheme _appBarTheme(BuildContext context) {
    return AppBarTheme(
        backgroundColor: AppColors.whiteSmoke,
        titleTextStyle: TextStyle(
          fontFamily: googleFont,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: AppColors.violetBlue,
          systemNavigationBarIconBrightness: Brightness.light,
        ));
  }
}
