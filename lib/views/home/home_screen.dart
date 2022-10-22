import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/repositories/network_movie_repository.dart';
import 'package:intern_task/views/home/widgets/movie_info_item.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
