// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/config/config_export.dart';
import 'package:client/core/core_export.dart';
import 'package:flutter/material.dart';

class TabSelectorWidget extends StatelessWidget {
  final List<String> titles;
  final int? index;
  final void Function(int index) onTap;
  const TabSelectorWidget({
    super.key,
    required this.titles,
    this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = index ?? 0;
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: titles.length,
        scrollDirection: Axis.horizontal,
        controller: ScrollController(keepScrollOffset: true),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: (index == currentIndex)
                    ? AppColors.violetBlue
                    : AppColors.whiteSmoke,
                shape: StadiumBorder(
                  side: (index == currentIndex)
                      ? BorderSide.none
                      : const BorderSide(width: 1, color: AppColors.violetBlue),
                ),
              ),
              child: Text(
                titles[index],
                style: context.textTheme.bodySmall!.copyWith(
                    color: (index == currentIndex)
                        ? AppColors.whiteSmoke
                        : AppColors.violetBlue),
              ),
            ),
          );
        },
      ),
    );
  }
}
