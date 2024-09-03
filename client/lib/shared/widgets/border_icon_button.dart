// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/config/config_export.dart';
import 'package:flutter/material.dart';

class BorderIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final String? tooltip;
  const BorderIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Tooltip(
        message: tooltip,
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey)),
          child: icon,
        ),
      ),
    );
  }
}
