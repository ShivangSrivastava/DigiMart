import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/common/widgets/border_icon_button.dart';
import 'package:client/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uicons/uicons.dart';

class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(
          title: "Discover",
          actions: [
            BorderIconButton(
              tooltip: "Saved Products",
              icon: Icon(UIcons.regularRounded.shopping_bag),
              onPressed: () {},
            )
          ],
        ),
        Shimmer.fromColors(
          baseColor: AppColors.deepNavyBlue,
          highlightColor: AppColors.grey,
          child: Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _skeletonShape(height: 50),
                    const SizedBox(height: 10),
                    _skeletonShape(height: 30, width: 100),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: _skeletonShape(width: 200),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _skeletonShape(height: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _skeletonShape(width: 40, height: 20),
                        _skeletonShape(width: 40, height: 20),
                        _skeletonShape(width: 40, height: 20),
                        _skeletonShape(width: 40, height: 20),
                        _skeletonShape(width: 40, height: 20),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _skeletonShape(
                          height: 200,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: _skeletonShape(
                          height: 200,
                        )),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _skeletonShape({double? height, double? width, Color? color}) {
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: color ?? AppColors.black.withOpacity(0.1),
      ),
    );
  }
}
