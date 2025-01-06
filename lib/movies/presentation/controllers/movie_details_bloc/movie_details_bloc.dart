import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/core/resources/all_import.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetailsUseCase _getMoviesDetailsUseCase;

  MovieDetailsBloc(this._getMoviesDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getMoviesDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movieDetails: r,
        ),
      ),
    );
  }
}
