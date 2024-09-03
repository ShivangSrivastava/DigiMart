import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/config/config_export.dart';
import 'package:client/features/guest/guest_export.dart';
import 'package:client/injection_container.dart';
import 'package:client/shared/shared_export.dart';
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
