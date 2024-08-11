import 'package:client/config/routes/app_route.dart';
import 'package:client/config/routes/routes_constants.dart';
import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(AppCheck()),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppAuthenticated) {
            context.goNamed(RoutesConstants.homePage);
          } else if (state is AppUnauthenticated) {
            context.goNamed(RoutesConstants.loginPage);
          }
        },
        child: MaterialApp.router(
          title: 'DigiMart',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
        ),
      ),
    );
  }
}
