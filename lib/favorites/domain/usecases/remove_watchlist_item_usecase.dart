import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/data/error/failure.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/favorites/domain/repository/favorite_repository.dart';

class RemoveFavoriteItemUseCase extends BaseUseCase<Unit, int> {
  final FavoriteRepository _baseFavoriteRepository;

  RemoveFavoriteItemUseCase(this._baseFavoriteRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseFavoriteRepository.removeWatchListItem(p);
  }
}
