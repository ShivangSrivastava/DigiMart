import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Login Page");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
    );
  }
}
