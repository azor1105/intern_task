import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';
import 'package:intern_task/data/models/network_movie/network_movie_model.dart';
import 'package:intern_task/views/downloaded_movie_watch/downloaded_movie_watch_screen.dart';
import 'package:intern_task/views/home/downloaded_movie/downloaded_movie.dart';
import 'package:intern_task/views/home/home_screen.dart';
import 'package:intern_task/views/online_movie_watch/online_movie_watch_screen.dart';

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
      case RouteNames.downloadedMovie:
        return MaterialPageRoute(
            builder: (context) => const DownloadedMovieScreen());
      case RouteNames.watchDownloadedMovie:
        return MaterialPageRoute(
          builder: (context) => DownloadedMovieWatchScreen(
            downloadedMovie: settings.arguments as DownloadedMovie,
          ),
        );
    }
    return null;
  }
}
