import 'package:movies_tv/search/domain/entities/search_result_item.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.item,
  });

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            item.isMovie
                ? context.pushNamed(AppRoutes.movieDetailsRoute,
                    params: {'movieId': item.tmdbID.toString()})
                : context.pushNamed(AppRoutes.tvShowDetailsRoute,
                    params: {'tvShowId': item.tmdbID.toString()});
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: ImageWithShimmer(
                imageUrl: item.posterUrl,
                width: double.infinity,
                height: AppSize.s150,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
