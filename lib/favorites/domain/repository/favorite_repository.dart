import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/data/error/failure.dart';
import 'package:movies_tv/core/resources/all_import.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<Media>>> getWatchListItems();
  Future<Either<Failure, int>> addWatchListItem(Media media);
  Future<Either<Failure, Unit>> removeWatchListItem(int index);
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId);
}
