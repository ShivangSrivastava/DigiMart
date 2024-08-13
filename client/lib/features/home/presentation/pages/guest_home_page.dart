import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/common/custom_icon.dart';
import 'package:client/core/common/custom_icon_button.dart';
import 'package:client/core/constants/app_icons.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:client/features/home/presentation/pages/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(
            color: AppColors.deepNavyBlue,
          ),
        ),
        actions: [
          CustomIconButton(
            tooltip: "Bag",
            icon: const CustomIcon(
              icon: AppIcons.bag,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBar(
              hintText: "Search",
              
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ));
              },
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              trailing: [
                IconButton(
                  icon: const CustomIcon(
                    icon: AppIcons.search,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
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
      height: 55,
      animationDuration: const Duration(milliseconds: 500),
      items: [
        CustomIcon(
          icon: AppIcons.home,
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
