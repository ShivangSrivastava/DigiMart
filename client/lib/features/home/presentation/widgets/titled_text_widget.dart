import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TitledTextWidget extends StatelessWidget {
  const TitledTextWidget({
    super.key,
  });

  Widget withTextButton(
    BuildContext context, {
    required String title,
    required String buttonLabel,
    required VoidCallback onTap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonLabel,
            style: context.textTheme.titleMedium!
                .copyWith(color: AppColors.violetBlue),
          ),
        ),
      ],
    );
  }

  Widget withoutTextButton(BuildContext context, {required String label}) {
    return Text(
      label,
      style: context.textTheme.headlineMedium,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
