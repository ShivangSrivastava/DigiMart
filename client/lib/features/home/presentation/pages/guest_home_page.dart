import 'package:flutter/material.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home Page");
    return Scaffold(
      appBar: AppBar(
        title: const Text("GuestHomePage"),
      ),
    );
  }
}
