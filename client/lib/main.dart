import 'package:client/features/app/presentation/pages/app.dart';
import 'package:client/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startupLocator();
  runApp(const App());
}