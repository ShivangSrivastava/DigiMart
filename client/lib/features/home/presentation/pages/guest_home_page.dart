import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          SearchBar(),
        ],
      ),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      color: AppColors.violetBlue,
      animationCurve: Curves.easeInOutCirc,
      animationDuration: const Duration(milliseconds: 500),
      items: [
        Icon(
          Icons.home,
          color: context.theme.scaffoldBackgroundColor,
        ),
        Icon(
          Icons.category,
          color: context.theme.scaffoldBackgroundColor,
        ),
        Icon(
          CupertinoIcons.person_fill,
          color: context.theme.scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
