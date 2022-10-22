import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/views/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkMovieRepository.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}