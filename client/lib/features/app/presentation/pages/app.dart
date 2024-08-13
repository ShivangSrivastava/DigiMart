import 'package:client/config/routes/app_route.dart';
import 'package:client/config/routes/routes_constants.dart';
import 'package:client/config/theme/app_colors.dart';
import 'package:client/config/theme/app_theme.dart';
import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:client/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.violetBlue,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AppBloc>()
            ..add(
              AppCheck(),
            ),
        ),
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
          theme: AppTheme.lightTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
