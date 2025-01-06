import 'package:dio/dio.dart';
import 'package:movies_tv/search/data/models/search_result_item_model.dart';

import 'package:movies_tv/core/resources/all_import.dart';

abstract class SearchRemoteDataSource {
  Future<List<SearchResultItemModel>> search(String title);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<List<SearchResultItemModel>> search(String title) async {
    final response = await Dio().get(ApiConstants.getSearchPath(title));
    if (response.statusCode == 200) {
      return List<SearchResultItemModel>.from((response.data['results'] as List)
          .where((e) => e['media_type'] != 'person')
          .map((e) => SearchResultItemModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
