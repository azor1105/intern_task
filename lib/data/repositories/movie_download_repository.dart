import 'package:dio/dio.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';
import 'package:intern_task/data/models/network_movie/network_movie_model.dart';
import 'package:intern_task/data/service/api/api_service.dart';
import 'package:intern_task/data/service/hive_service/hive_service.dart';

class MovieDownloadRepository {
  MovieDownloadRepository(
      {required ApiService apiService, required HiveService hiveService})
      : _apiService = apiService,
        _hiveService = hiveService;

  final ApiService _apiService;
  final HiveService _hiveService;

  Future<void> downloadFile({required NetworkMovieModel movieModel}) async {
    String path = await _apiService.downloadFile(
        url: movieModel.videoUrl, name: movieModel.name);
    await _hiveService.addMovie(
      DownloadedMovie()
        ..imageLink = movieModel.imageUrl
        ..path = path
        ..name = movieModel.name,
    );
  }
}
