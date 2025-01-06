import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesDetailsUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseMoviesRespository.getMovieDetails(p);
  }
}
