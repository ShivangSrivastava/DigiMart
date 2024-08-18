// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/common/widgets/glass_morphism_widget.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final ImageProvider<Object> imageProvider;
  const ProductCardWidget({
    super.key,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      height: 150,
      width: context.screenWidth! * 0.5,
      alignment: Alignment.bottomCenter,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
        ),
        color: AppColors.black.withOpacity(0.2),
      ),
      child: GlassMorphismWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Smartphone X Pro",
                  maxLines: 1,
                  style: context.textTheme.bodyLarge!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "10.1",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
