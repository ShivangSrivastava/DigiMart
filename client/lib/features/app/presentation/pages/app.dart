import 'package:client/client.dart';
import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AppBloc>()..add(NetworkStatusChecked()),
        ),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (_, state) {
        switch (state){

          case AppInitial():

          case VerificationSuccess():
            GoRouter.of(context).go()
          case VerificationFailure():
            // TODO: Handle this case.
          case AppLoading():
            // TODO: Handle this case.
          case NetworkError():
            // TODO: Handle this case.
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
