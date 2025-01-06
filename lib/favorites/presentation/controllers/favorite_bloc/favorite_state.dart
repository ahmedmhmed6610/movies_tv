part of 'favorite_bloc.dart';

enum FavoriteRequestStatus {
  empty,
  loading,
  loaded,
  error,
  itemAdded,
  itemRemoved,
  isItemAdded,
}

class WatchlistState extends Equatable {
  const WatchlistState({
    this.id,
    this.items = const [],
    this.status = FavoriteRequestStatus.loading,
    this.message = '',
  });

  final int? id;
  final List<Media> items;
  final FavoriteRequestStatus status;
  final String message;

  WatchlistState copyWith({
    int? id,
    List<Media>? items,
    FavoriteRequestStatus? status,
    String? message,
  }) {
    return WatchlistState(
      id: id ?? this.id,
      items: items ?? this.items,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        id,
        items,
        status,
        message,
      ];
}
