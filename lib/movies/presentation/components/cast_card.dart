import 'package:movies_tv/movies/domain/entities/cast.dart';
import 'package:movies_tv/core/resources/all_import.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: AppSize.s100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8),
            child: ImageWithShimmer(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: AppSize.s130,
            ),
          ),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
