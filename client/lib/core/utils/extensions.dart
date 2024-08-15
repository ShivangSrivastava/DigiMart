import 'package:flutter/material.dart';

extension ContextEntension on BuildContext {
  double? get screenHeight => MediaQuery.of(this).size.height;
  double? get screenWidth => MediaQuery.of(this).size.width;
  double? get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension StringExtension on String {
  String toTitleCase() {
    final first = this[0].toUpperCase();
    return first + substring(1);
  }
}

extension ColorExtension on Color {
  MaterialColor get materialColor => _generateMaterialColor(this);
}

MaterialColor _generateMaterialColor(Color baseColor) {
  Map<int, Color> colorShades = {
    50: _shadeColor(baseColor, 0.1),
    100: _shadeColor(baseColor, 0.2),
    200: _shadeColor(baseColor, 0.3),
    300: _shadeColor(baseColor, 0.4),
    400: _shadeColor(baseColor, 0.5),
    500: baseColor,
    600: _shadeColor(baseColor, 0.6),
    700: _shadeColor(baseColor, 0.7),
    800: _shadeColor(baseColor, 0.8),
    900: _shadeColor(baseColor, 0.9),
  };

  return MaterialColor(baseColor.value, colorShades);
}

Color _shadeColor(Color color, double factor) {
  return Color.fromRGBO(
    (color.red * factor).toInt(),
    (color.green * factor).toInt(),
    (color.blue * factor).toInt(),
    1.0,
  );
}
