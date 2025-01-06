import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteLocalDataSource _baseFavoriteLocalDataSource;

  FavoriteRepositoryImpl(this._baseFavoriteLocalDataSource);

  @override
  Future<Either<Failure, List<Media>>> getWatchListItems() async {
    final result = (await _baseFavoriteLocalDataSource.getWatchListItems());
    try {
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> addWatchListItem(Media media) async {
    try {
      int id = await _baseFavoriteLocalDataSource.addWatchListItem(
        FavoriteItemModel.fromEntity(media),
      );
      return Right(id);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWatchListItem(int index) async {
    try {
      await _baseFavoriteLocalDataSource.removeWatchListItem(index);
      return const Right(unit);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async {
    try {
      final result = await _baseFavoriteLocalDataSource.isItemAdded(tmdbId);
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }
}
