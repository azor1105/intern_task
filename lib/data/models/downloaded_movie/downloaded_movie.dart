import 'package:hive_flutter/hive_flutter.dart';

part 'downloaded_movie.g.dart';

@HiveType(typeId: 0)
class DownloadedMovie extends HiveObject {
  @HiveField(1)
  late String path;

  @HiveField(2)
  late String imageLink;

  @HiveField(3)
  late String name;
}