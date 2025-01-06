import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/favorites/domain/repository/favorite_repository.dart';

class CheckIfItemAddedUseCase extends BaseUseCase<int, int> {
  final FavoriteRepository _FavoriteRepository;

  CheckIfItemAddedUseCase(this._FavoriteRepository);
  @override
  Future<Either<Failure, int>> call(int p) async {
    return await _FavoriteRepository.checkIfItemAdded(p);
  }
}
