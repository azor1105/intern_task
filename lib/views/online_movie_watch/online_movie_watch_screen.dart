import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:intern_task/data/models/network_movie/network_movie_model.dart';
import 'package:video_player/video_player.dart';

class OnlineMovieWatchScreen extends StatefulWidget {
  const OnlineMovieWatchScreen({super.key, required this.movieModel});
  final NetworkMovieModel movieModel;
  @override
  State<OnlineMovieWatchScreen> createState() => _OnlineMovieWatchScreenState();
}

class _OnlineMovieWatchScreenState extends State<OnlineMovieWatchScreen> {
  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.movieModel.videoUrl,
    )..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  VideoPlayerController? _controller;

  @override
  Widget build(BuildContext context) {
    ChewieController chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieModel.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : const CircularProgressIndicator.adaptive(),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.pause();
    _controller!.dispose();
    super.dispose();
  }
}
