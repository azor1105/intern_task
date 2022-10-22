import 'package:intern_task/data/models/network_movie/network_movie_model.dart';

class NetworkMovieRepository {
  static final NetworkMovieRepository _instance = NetworkMovieRepository.init();
  static NetworkMovieRepository get instance => _instance;
  NetworkMovieRepository.init();

  final imagesOfMovies = [
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/SubaruOutbackOnStreetAndDirt.jpg",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"
  ];

  final urlsOfMovies = [
    "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
  ];

  final nameOfMovies = [
    "Big buck bunny",
    "Elephant's dream",
    "For bigger blazes",
    "For bigger escapes",
    "For bigger fun",
    "For bigger joyrides",
    "For bigger meltdowns",
    "Subaru outback on street and dirt",
    "Tears of steel",
  ];

  List<NetworkMovieModel> networkMovies = [];

  void getNetworkMovies() {
    for (int i = 0; i < urlsOfMovies.length; i++) {
      networkMovies.add(
        NetworkMovieModel(
          imageUrl: imagesOfMovies[i],
          name: nameOfMovies[i],
          videoUrl: urlsOfMovies[i],
        ),
      );
    }
  }
}
