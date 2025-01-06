import 'package:get_it/get_it.dart';
import 'package:movies_tv/core/resources/all_import.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
    sl.registerLazySingleton<TVShowsRemoteDataSource>(
        () => TVShowsRemoteDataSourceImpl());
    sl.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl());
    sl.registerLazySingleton<FavoriteLocalDataSource>(
        () => FavoriteLocalDataSourceImpl());

    // Repository
    sl.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(sl()));
    sl.registerLazySingleton<TVShowsRepository>(
        () => TVShowsRepositoryImpl(sl()));
    sl.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(sl()));
    sl.registerLazySingleton<FavoriteRepository>(
        () => FavoriteRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetTVShowDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSeasonDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoriteItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddFavoriteItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveFavoriteItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfItemAddedUseCase(sl()));

    // Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
    sl.registerFactory(() => TVShowsBloc(sl()));
    sl.registerFactory(() => TVShowDetailsBloc(sl(), sl()));
    sl.registerFactory(() => PopularTVShowsBloc(sl()));
    sl.registerFactory(() => TopRatedTVShowsBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    sl.registerFactory(() => FavoriteBloc(sl(), sl(), sl(), sl()));
  }
}
