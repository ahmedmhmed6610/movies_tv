import 'package:dio/dio.dart';
import 'package:movies_tv/search/domain/entities/search_result_item.dart';
import 'package:movies_tv/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource _baseSearchRemoteDataSource;

  SearchRepositoryImpl(this._baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchResultItem>>> search(String title) async {
    try {
      final result = await _baseSearchRemoteDataSource.search(title);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
