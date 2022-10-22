import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/models/network_movie/network_movie_model.dart';
import 'package:intern_task/views/home/home_screen.dart';
import 'package:intern_task/views/home/movie_watch/movie_watch_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteNames.onlineMovie:
        return MaterialPageRoute(
          builder: (context) => OnlineMovieWatchScreen(
            movieModel: settings.arguments as NetworkMovieModel,
          ),
        );
    }
    return null;
  }
}
