import 'package:flutter/material.dart';

extension ContextEntension on BuildContext {
  double? get screenHeight => MediaQuery.of(this).size.height;
  double? get screenWidth => MediaQuery.of(this).size.width;
  double? get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  ThemeData get theme => Theme.of(this);
}
