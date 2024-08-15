// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/common/widgets/home_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class BaseHomePage extends StatelessWidget {
  final bool isAuthenticatedHome;
  final Widget body;
  final List<String> routes;
  const BaseHomePage({
    super.key,
    required this.isAuthenticatedHome,
    required this.body,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      extendBody: false,
      bottomNavigationBar: HomeNavigationBar(routes: routes),
    );
  }
}
