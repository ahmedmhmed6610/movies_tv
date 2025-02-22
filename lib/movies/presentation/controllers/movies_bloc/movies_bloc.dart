import 'dart:async';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/movies/presentation/controllers/movies_bloc/movies_event.dart';
import 'package:movies_tv/movies/presentation/controllers/movies_bloc/movies_state.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase _getMoviesUseCase;

  MoviesBloc(
    this._getMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
  }

  Future<void> _getMovies(
      GetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movies: r,
        ),
      ),
    );
  }
}
