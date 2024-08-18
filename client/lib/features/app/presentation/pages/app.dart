import 'package:client/config/routes/app_route.dart';
import 'package:client/config/routes/routes_constants.dart';
import 'package:client/config/theme/app_theme.dart';
import 'package:client/core/common/bloc/navigation_bar_bloc.dart';
import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:client/features/home/presentation/bloc/home_product/home_product_bloc.dart';
import 'package:client/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AppBloc>()
            ..add(
              AppCheck(),
            ),
        ),
        BlocProvider(
          create: (_) => sl<NavigationBarBloc>()
            ..add(
              const NavigationBarChangeIndexEvent(0),
            ),
        ),
        BlocProvider(
            create: (_) => sl<HomeProductBloc>()
              ..add(
                HomeProductPageInitEvent(),
              )),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (_, state) {
          if (state is AppLoading) {
            router.goNamed(RoutesConstants.loadingPage);
          } else if (state is AppAuthenticated) {
            router.goNamed(RoutesConstants.authenticatedHomePage);
          } else {
            router.goNamed(RoutesConstants.guestHomePage);
          }
        },
        child: MaterialApp.router(
          title: 'DigiMart',
          theme: AppTheme.lightTheme(context),
          routerConfig: router,
        ),
      ),
    );
  }
}
