import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/common/widgets/border_icon_button.dart';
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
