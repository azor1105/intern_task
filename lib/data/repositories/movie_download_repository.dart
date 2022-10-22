import 'package:dio/dio.dart';

class MovieDownloadRepository {
  static final MovieDownloadRepository _instance =
      MovieDownloadRepository.init();
  static MovieDownloadRepository get instance => _instance;
  MovieDownloadRepository.init();


  

}
