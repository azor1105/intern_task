part of 'download_movie_cubit.dart';

enum DownloadMovieStatus {
  pure,
  downloadingOnProgress,
  downloadingOnFailure,
  downloadingOnSuccess,
}

class DownloadMovieState extends Equatable {
  const DownloadMovieState({
    required this.downloadedMovies,
    this.status = DownloadMovieStatus.pure,
    this.errorText = '',
  });

  final DownloadMovieStatus status;
  final String errorText;
  final List<DownloadedMovie> downloadedMovies;

  DownloadMovieState copyWith({
    DownloadMovieStatus? status,
    String? errorText,
    List<DownloadedMovie>? downloadedMovies,
  }) =>
      DownloadMovieState(
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
        downloadedMovies: downloadedMovies ?? this.downloadedMovies,
      );

  @override
  List<Object> get props => [status, errorText, downloadedMovies];
}
