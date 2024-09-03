import 'package:client/config/config_export.dart';
import 'package:client/injection_container.dart';
import 'package:client/shared/shared_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uicons/uicons.dart';

class HomeNavigationBar extends StatelessWidget {
  final List<String> routes;
  const HomeNavigationBar({
    super.key,
    required this.routes,
  });
  @override
  Widget build(BuildContext context) {
    final navBarBloc = sl<NavigationBarBloc>();
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
        builder: (context, state) {
      if (state is NavigationBarChangeIndexState) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (value) {
              if (value < routes.length) {
                navBarBloc.add(NavigationBarChangeIndexEvent(value));
              }
            },
            items: List.generate(
              routes.length,
              (index) {
                final _NavBarItemData itemData =
                    _NavBarItemData.fromRoute(routes[index]);
                return BottomNavigationBarItem(
                  icon: itemData.unselectedIcon,
                  activeIcon: itemData.selectedIcon,
                  tooltip: itemData.label,
                  label: itemData.label,
                );
              },
            ),
          ),
        );
      }
      return Container();
    });
  }
}

class _NavBarItemData {
  final String route;
  final String label;
  final Widget selectedIcon;
  final Widget unselectedIcon;

  _NavBarItemData(
      {required this.route,
      required this.label,
      required this.selectedIcon,
      required this.unselectedIcon});
  factory _NavBarItemData.fromRoute(String route) {
    String? tempLabel;
    Widget? tempSelectedIcon;
    Widget? tempUnselectedIcon;
    switch (route) {
      case RoutesConstants.authenticatedHomePage ||
            RoutesConstants.guestHomePage:
        tempLabel = "Home";
        tempSelectedIcon = Icon(UIcons.solidRounded.home);
        tempUnselectedIcon = Icon(UIcons.regularRounded.home);
        break;
      case RoutesConstants.searchPage:
        tempLabel = "Search";
        tempSelectedIcon = Icon(UIcons.solidRounded.search);
        tempUnselectedIcon = Icon(UIcons.regularRounded.search);
      default:
    }
    return _NavBarItemData(
        route: route,
        label: tempLabel!,
        selectedIcon: tempSelectedIcon!,
        unselectedIcon: tempUnselectedIcon!);
  }
}
