import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intern_task/data/models/network_movie/network_movie_model.dart';
import 'package:intern_task/data/repositories/movie_download_repository.dart';

part 'download_movie_state.dart';

class DownloadMovieCubit extends Cubit<DownloadMovieState> {
  DownloadMovieCubit({required MovieDownloadRepository movieDownloadRepository})
      : _movieDownloadRepository = movieDownloadRepository,
        super(const DownloadMovieState());

  final MovieDownloadRepository _movieDownloadRepository;

  Future<void> downloadMovie({required NetworkMovieModel movieModel}) async {
    emit(state.copyWith(status: DownloadMovieStatus.downloadingOnProgress));
    try {
      await _movieDownloadRepository.downloadFile(movieModel: movieModel);
      emit(state.copyWith(status: DownloadMovieStatus.downloadingOnSuccess));
    } catch (e) {
      emit(
        state.copyWith(
          errorText: e.toString(),
          status: DownloadMovieStatus.downloadingOnFailure,
        ),
      );
    }
  }
}
