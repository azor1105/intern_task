import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/core/utils/get_toast.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/views/home/downloaded_movie/cubit/download_movie/download_movie_cubit.dart';
import 'package:intern_task/views/home/widgets/movie_info_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<DownloadMovieCubit>().getDownloadedMovies();
              Navigator.pushNamed(
                context,
                RouteNames.downloadedMovie,
              );
            },
            icon: const Icon(Icons.download_done),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocListener<DownloadMovieCubit, DownloadMovieState>(
            listener: (context, state) {
              if (state.status == DownloadMovieStatus.downloadingOnFailure) {
                GetToast.getMyToast(message: "Try again");
              } else if (state.status ==
                  DownloadMovieStatus.downloadingOnProgress) {
                GetToast.getMyToast(message: "Dowloading...");
              } else if (state.status ==
                  DownloadMovieStatus.downloadingOnSuccess) {
                GetToast.getMyToast(message: "Successfully downloaded");
              }
            },
            child: const SizedBox(),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                NetworkMovieRepository.instance.networkMovies.length,
                (index) => MovieInfoItem(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.onlineMovie,
                      arguments:
                          NetworkMovieRepository.instance.networkMovies[index],
                    );
                  },
                  movieModel:
                      NetworkMovieRepository.instance.networkMovies[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
