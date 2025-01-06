import 'package:movies_tv/core/resources/all_import.dart';

class FavoriteItemModel extends Media {
  const FavoriteItemModel({
    required super.tmdbID,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterUrl,
    required super.backdropUrl,
    required super.overview,
    required super.isMovie,
  });

  factory FavoriteItemModel.fromEntity(Media media) {
    return FavoriteItemModel(
      tmdbID: media.tmdbID,
      title: media.title,
      releaseDate: media.releaseDate,
      voteAverage: media.voteAverage,
      posterUrl: media.posterUrl,
      backdropUrl: media.backdropUrl,
      overview: media.overview,
      isMovie: media.isMovie,
    );
  }
}
