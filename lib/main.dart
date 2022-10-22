import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';
import 'package:intern_task/data/repositories/movie_download_repository.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/data/service/api/api_service.dart';
import 'package:intern_task/data/service/hive_service/hive_service.dart';
import 'package:intern_task/views/router/router.dart';

import 'views/home/downloaded_movie/cubit/download_movie/download_movie_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkMovieRepository.instance.getNetworkMovies();
  await Hive.initFlutter();
  Hive.registerAdapter(DownloadedMovieAdapter());
  final hiveService = HiveService();
  await hiveService.openbox();
  runApp(
    BlocProvider(
      create: (context) => DownloadMovieCubit(
        movieDownloadRepository: MovieDownloadRepository(
          hiveService: hiveService,
          apiService: ApiService.instance,
        ),
      ),
      child: const App(),
    ),
  );
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
