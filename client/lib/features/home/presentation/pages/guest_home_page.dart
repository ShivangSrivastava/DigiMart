import 'package:client/config/routes/routes_constants.dart';
import 'package:client/config/theme/app_colors.dart';
import 'package:client/core/common/bloc/navigation_bar_bloc.dart';
import 'package:client/core/common/widgets/border_icon_button.dart';
import 'package:client/core/common/widgets/search_bar_widget.dart';
import 'package:client/core/utils/extensions.dart';
import 'package:client/features/home/presentation/pages/base_home_page.dart';
import 'package:client/features/search/presentation/pages/search_page.dart';
import 'package:client/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uicons/uicons.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarBloc = sl<NavigationBarBloc>();
    final List<Widget> pages = [_buildHome(context), SearchPage()];
    final controller = PageController();
    return BaseHomePage(
      isAuthenticatedHome: false,
      body: BlocListener<NavigationBarBloc, NavigationBarState>(
          listener: (context, state) {
            if (state is NavigationBarChangeIndexState) {
              controller.animateToPage(
                state.currentIndex,
                curve: Curves.linearToEaseOut,
                duration: const Duration(milliseconds: 400),
              );
              if (state.currentIndex != 1) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            }
          },
          child: PageView.builder(
            controller: controller,
            itemCount: pages.length,
            onPageChanged: (value) =>
                navBarBloc.add(NavigationBarChangeIndexEvent(value)),
            itemBuilder: (context, index) {
              return pages[index];
            },
          )),
      routes: const [
        RoutesConstants.guestHomePage,
        RoutesConstants.searchPage,
      ],
    );
  }

  Widget _buildHome(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text(
            "Discover",
            style: TextStyle(
              color: AppColors.deepNavyBlue,
            ),
          ),
          actions: [
            BorderIconButton(
              tooltip: "Saved Products",
              icon: Icon(UIcons.regularRounded.shopping_bag),
              onPressed: () {},
            )
          ],
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBarWidget(
                    onTap: () {
                      sl<NavigationBarBloc>()
                          .add(const NavigationBarChangeIndexEvent(1));
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "For You",
                    style: context.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const ProductCard();
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: context.textTheme.titleLarge,
                      ),
                      TextButton(
                        child: Text(
                          "See all",
                          style: context.textTheme.titleMedium!
                              .copyWith(color: AppColors.violetBlue),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 16),
                          width: 50,
                          alignment: const Alignment(0, 0),
                          decoration: const ShapeDecoration(
                            color: AppColors.violetBlue,
                            shape: StadiumBorder(
                              side: BorderSide.none,
                            ),
                          ),
                          child: Text(
                            index.toString(),
                            style: context.textTheme.bodyMedium!
                                .copyWith(color: AppColors.whiteSmoke),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => const Row(
                        children: [
                          Expanded(child: ProductCard()),
                          Expanded(child: ProductCard()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      height: 150,
      width: context.screenWidth! * 0.5,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppColors.softMint,
      ),
    );
  }
}
