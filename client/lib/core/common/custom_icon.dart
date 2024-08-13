import 'package:client/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

const String iconDir = "assets/images/icons";
const String iconExtension = ".png";

String _iconPath(String icon) => "$iconDir/$icon$iconExtension";

class CustomIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const CustomIcon({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 24,
      child: Image.asset(
        _iconPath(icon),
        color: color ?? AppColors.black,
      ),
    );
  }
}
