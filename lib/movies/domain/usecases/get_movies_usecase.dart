import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class GetMoviesUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseMoviesRespository.getMovies();
  }
}
