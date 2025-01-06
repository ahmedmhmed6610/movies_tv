part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class GetWatchListItemsEvent extends FavoriteEvent {
  @override
  List<Object?> get props => [];
}

class AddWatchListItemEvent extends FavoriteEvent {
  final Media media;

  const AddWatchListItemEvent({
    required this.media,
  });

  @override
  List<Object?> get props => [media];
}

class RemoveWatchListItemEvent extends FavoriteEvent {
  final int index;

  const RemoveWatchListItemEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CheckItemAddedEvent extends FavoriteEvent {
  final int tmdbId;

  const CheckItemAddedEvent({
    required this.tmdbId,
  });

  @override
  List<Object?> get props => [tmdbId];
}
