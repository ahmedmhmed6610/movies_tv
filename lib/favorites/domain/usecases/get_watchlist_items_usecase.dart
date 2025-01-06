import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/domain/entities/media.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/favorites/domain/repository/favorite_repository.dart';

class GetFavoriteItemsUseCase extends BaseUseCase<List<Media>, NoParameters> {
  final FavoriteRepository _baseFavoriteRepository;

  GetFavoriteItemsUseCase(this._baseFavoriteRepository);

  @override
  Future<Either<Failure, List<Media>>> call(NoParameters p) async {
    return await _baseFavoriteRepository.getWatchListItems();
  }
}
