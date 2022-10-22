import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';
import 'package:video_player/video_player.dart';

class DownloadedMovieWatchScreen extends StatefulWidget {
  DownloadedMovieWatchScreen({
    Key? key,
    required this.downloadedMovie,
  }) : super(key: key);
  DownloadedMovie downloadedMovie;
  @override
  State<DownloadedMovieWatchScreen> createState() =>
      _DownloadedMovieWatchScreenState();
}

class _DownloadedMovieWatchScreenState
    extends State<DownloadedMovieWatchScreen> {
  _DownloadedMovieWatchScreenState();
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(File(widget.downloadedMovie.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.downloadedMovie.name),
        centerTitle: true,
      ),
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
