import 'package:movies_tv/core/resources/all_import.dart';

abstract class FavoriteLocalDataSource {
  Future<List<FavoriteItemModel>> getWatchListItems();
  Future<int> addWatchListItem(FavoriteItemModel item);
  Future<void> removeWatchListItem(int index);
  Future<int> isItemAdded(int tmdbID);
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  final Box _box = Hive.box('items');

  @override
  Future<List<FavoriteItemModel>> getWatchListItems() async {
    return _box.values
        .map((e) => FavoriteItemModel.fromEntity(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Future<int> addWatchListItem(FavoriteItemModel item) async {
    return await _box.add(item);
  }

  @override
  Future<void> removeWatchListItem(int index) async {
    await _box.deleteAt(index);
  }

  @override
  Future<int> isItemAdded(int tmdbID) async {
    return _box.values.toList().indexWhere((e) => e.tmdbID == tmdbID);
  }
}
