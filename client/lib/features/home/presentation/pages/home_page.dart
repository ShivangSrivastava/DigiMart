import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home Page");
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
    );
  }
}
