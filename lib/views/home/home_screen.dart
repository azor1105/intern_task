import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/views/home/widgets/movie_info_item.dart';
import 'package:video_player/video_player.dart';

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
