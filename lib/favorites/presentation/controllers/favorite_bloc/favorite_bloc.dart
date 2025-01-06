import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core/domain/usecase/base_use_case.dart';
import 'package:movies_tv/core/resources/all_import.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, WatchlistState> {
  FavoriteBloc(
    this._GetFavoriteItemsUseCase,
    this._AddFavoriteItemUseCase,
    this._RemoveFavoriteItemUseCase,
    this._checkIfItemAddedUseCase,
  ) : super(const WatchlistState()) {
    on<GetWatchListItemsEvent>(_getWatchListItems);
    on<AddWatchListItemEvent>(_addWatchListItem);
    on<RemoveWatchListItemEvent>(_removeWatchListItem);
    on<CheckItemAddedEvent>(_checkItemAdded);
  }

  final GetFavoriteItemsUseCase _GetFavoriteItemsUseCase;
  final AddFavoriteItemUseCase _AddFavoriteItemUseCase;
  final RemoveFavoriteItemUseCase _RemoveFavoriteItemUseCase;
  final CheckIfItemAddedUseCase _checkIfItemAddedUseCase;

  Future<void> _getWatchListItems(
      FavoriteEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(
        status: FavoriteRequestStatus.loading,
      ),
    );
    final result = await _GetFavoriteItemsUseCase.call(const NoParameters());
    result.fold(
      (l) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            const WatchlistState(
              status: FavoriteRequestStatus.empty,
            ),
          );
        } else {
          emit(
            WatchlistState(
              status: FavoriteRequestStatus.loaded,
              items: r,
            ),
          );
        }
      },
    );
  }

  Future<void> _addWatchListItem(
      AddWatchListItemEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(
        status: FavoriteRequestStatus.loading,
      ),
    );
    final result = await _AddFavoriteItemUseCase.call(event.media);
    result.fold(
      (l) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.itemAdded,
          id: r,
        ),
      ),
    );
  }

  Future<void> _removeWatchListItem(
      RemoveWatchListItemEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(
        status: FavoriteRequestStatus.loading,
      ),
    );
    final result = await _RemoveFavoriteItemUseCase.call(event.index);
    result.fold(
      (l) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        const WatchlistState(
          status: FavoriteRequestStatus.itemRemoved,
        ),
      ),
    );
  }

  FutureOr<void> _checkItemAdded(
      CheckItemAddedEvent event, Emitter<WatchlistState> emit) async {
    emit(
      const WatchlistState(
        status: FavoriteRequestStatus.loading,
      ),
    );
    final result = await _checkIfItemAddedUseCase.call(event.tmdbId);
    result.fold(
      (l) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        WatchlistState(
          status: FavoriteRequestStatus.isItemAdded,
          id: r,
        ),
      ),
    );
  }
}
