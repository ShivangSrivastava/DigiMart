import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/config/routes/routes_constants.dart';
import 'package:client/core/common/bloc/navigation_bar_bloc.dart';
import 'package:client/core/common/widgets/border_icon_button.dart';
import 'package:client/core/common/widgets/search_bar_widget.dart';
import 'package:client/features/home/presentation/bloc/home_product/home_product_bloc.dart';
import 'package:client/features/home/presentation/pages/base_home_page.dart';
import 'package:client/features/home/presentation/widgets/category_product_widget.dart';
import 'package:client/features/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:client/features/home/presentation/widgets/product_card_widget.dart';
import 'package:client/features/home/presentation/widgets/tab_selector_widget.dart';
import 'package:client/features/home/presentation/widgets/titled_text_widget.dart';
import 'package:client/features/search/presentation/pages/search_page.dart';
import 'package:client/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uicons/uicons.dart';

part 'guest_home_page.main.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarBloc = sl<NavigationBarBloc>();
    final List<Widget> pages = [_buildHome(context), const SearchPage()];
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
}
