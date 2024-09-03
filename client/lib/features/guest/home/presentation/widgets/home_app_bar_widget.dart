import 'package:client/config/config_export.dart';
import 'package:client/shared/shared_export.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  final String title;
  final List<BorderIconButton>? actions;
  const HomeAppBarWidget({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.deepNavyBlue,
        ),
      ),
      actions: actions,
    );
  }
}
