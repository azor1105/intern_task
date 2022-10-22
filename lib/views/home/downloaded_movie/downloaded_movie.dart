import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/core/constants/router_names.dart';
import 'package:intern_task/views/downloaded_movie_watch/downloaded_movie_watch_screen.dart';
import 'package:intern_task/views/home/downloaded_movie/cubit/download_movie/download_movie_cubit.dart';

class DownloadedMovieScreen extends StatelessWidget {
  const DownloadedMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloaded movies"),
        centerTitle: true,
      ),
      body: BlocBuilder<DownloadMovieCubit, DownloadMovieState>(
          builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: state.downloadedMovies.length,
          itemBuilder: (context, index) {
            var downloadedMovie = state.downloadedMovies[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.watchDownloadedMovie,
                  arguments: state.downloadedMovies[index],
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 5,
                      blurRadius: 5,
                      color: Colors.grey.shade300,
                      offset: const Offset(1, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: downloadedMovie.imageLink,
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      downloadedMovie.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
