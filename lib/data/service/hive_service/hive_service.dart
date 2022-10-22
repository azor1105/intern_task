import 'package:hive/hive.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';

class HiveService {
  Box<DownloadedMovie>? downloadedMovieBox;

  Future<Box<DownloadedMovie>> openbox() async {
    downloadedMovieBox ??=
        await Hive.openBox<DownloadedMovie>("downloaded_movie");
    return downloadedMovieBox!;
  }

  List<DownloadedMovie> getDownloadedMovies(Box box) {
    return box.values.toList().cast<DownloadedMovie>();
  }

  Future<void> addMovie(Box box, DownloadedMovie cachedPrayerModel) async {
    await box.add(cachedPrayerModel);
  }

  Future<void> deleteAllCachedPrayer(Box box) async {
    await box.clear();
  }
}
