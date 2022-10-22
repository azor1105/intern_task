part of 'download_movie_cubit.dart';

enum DownloadMovieStatus {
  pure,
  downloadingOnProgress,
  downloadingOnFailure,
  downloadingOnSuccess,
}

class DownloadMovieState extends Equatable {
  const DownloadMovieState({
    this.status = DownloadMovieStatus.pure,
    this.errorText = '',
  });

  final DownloadMovieStatus status;
  final String errorText;

  DownloadMovieState copyWith({
    DownloadMovieStatus? status,
    String? errorText,
  }) =>
      DownloadMovieState(
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object> get props => [status];
}
