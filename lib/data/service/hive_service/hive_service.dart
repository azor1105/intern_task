import 'package:hive/hive.dart';
import 'package:intern_task/data/models/downloaded_movie/downloaded_movie.dart';

class HiveService {
  Box<DownloadedMovie>? downloadedMovieBox;

  Future<Box> openbox() async {
    downloadedMovieBox ??=
        await Hive.openBox<DownloadedMovie>("downloaded_movie");
    return downloadedMovieBox!;
  }

  List<DownloadedMovie> getCachedPrayers(Box box) {
    return box.values.toList().cast<DownloadedMovie>();
  }

  Future<void> addMovie(DownloadedMovie cachedPrayerModel) async {
    await downloadedMovieBox!.add(cachedPrayerModel);
  }

  Future<void> deleteAllCachedPrayer(Box box) async {
    await box.clear();
  }
}
