import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/views/home/home_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
    return null;
  }
}
