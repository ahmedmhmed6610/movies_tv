import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/data/error/failure.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/core/resources/all_import.dart';

class GetAllTopRatedTVShowsUseCase extends BaseUseCase<List<Media>, int> {
  final TVShowsRepository _baseTVShowsRepository;

  GetAllTopRatedTVShowsUseCase(this._baseTVShowsRepository);

  @override
  Future<Either<Failure, List<Media>>> call(int p) async {
    return await _baseTVShowsRepository.getAllTopRatedTVShows(p);
  }
}
