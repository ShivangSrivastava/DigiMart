import 'package:client/client.dart';
import 'package:client/features/app/presentation/pages/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startupLocator();
  runApp(const App());
}
