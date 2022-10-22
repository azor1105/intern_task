import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DownloadedMovieWatchScreen extends StatefulWidget {
  File? sub1;
  DownloadedMovieWatchScreen({
    required this.sub1,
  });
  @override
  State<DownloadedMovieWatchScreen> createState() => _DownloadedMovieWatchScreenState(sub1: sub1);
}

class _DownloadedMovieWatchScreenState extends State<DownloadedMovieWatchScreen> {
  File? sub1;
  _DownloadedMovieWatchScreenState({
    required this.sub1,
  });
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(sub1!)
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