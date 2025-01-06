import 'package:dartz/dartz.dart';
import 'package:movies_tv/core/data/error/failure.dart';
import 'package:movies_tv/search/domain/entities/search_result_item.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
