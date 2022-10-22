import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/data/service/hive_service/hive_service.dart';
import 'package:intern_task/views/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkMovieRepository.instance.getNetworkMovies();
  await Hive.initFlutter();
  Hive.registerAdapter(DownloadedMovieAdapter());
  final hiveDatabase = HiveService();
  await hiveDatabase.openbox();
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
