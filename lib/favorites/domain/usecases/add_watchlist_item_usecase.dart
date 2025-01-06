import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/resources/all_import.dart';

import '../../../core/data/error/failure.dart';
import '../../../core/domain/usecase/base_use_case.dart';

class AddFavoriteItemUseCase extends BaseUseCase<int, Media> {
  final FavoriteRepository _baseFavoriteRepository;

  AddFavoriteItemUseCase(this._baseFavoriteRepository);

  @override
  Future<Either<Failure, int>> call(Media p) async {
    return await _baseFavoriteRepository.addWatchListItem(p);
  }
}
