import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_tv/core/resources/all_import.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.mediaDetails,
    required this.detailsWidget,
    super.key,
  });

  final MediaDetails mediaDetails;
  final Widget detailsWidget;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    context
        .read<FavoriteBloc>()
        .add(CheckItemAddedEvent(tmdbId: mediaDetails.tmdbID));
    return SafeArea(
      child: Stack(
        children: [
          SliderCardImage(imageUrl: mediaDetails.backdropUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mediaDetails.title,
                            maxLines: 2,
                            style: textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppPadding.p4,
                              bottom: AppPadding.p6,
                            ),
                            child: detailsWidget,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.ratingIconColor,
                                size: AppSize.s18,
                              ),
                              Text(
                                '${mediaDetails.voteAverage} ',
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                mediaDetails.voteCount,
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (mediaDetails.trailerUrl.isNotEmpty) ...[
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(mediaDetails.trailerUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Container(
                          height: AppSize.s40,
                          width: AppSize.s40,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p16,
              right: AppPadding.p16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.secondaryText,
                      size: AppSize.s20,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    mediaDetails.isAdded
                        ? context
                            .read<FavoriteBloc>()
                            .add(RemoveWatchListItemEvent(mediaDetails.id!))
                        : context.read<FavoriteBloc>().add(
                              AddWatchListItemEvent(
                                  media: Media.fromMediaDetails(mediaDetails)),
                            );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: BlocConsumer<FavoriteBloc, WatchlistState>(
                      listener: (context, state) {
                        if (state.status == FavoriteRequestStatus.itemAdded) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        } else if (state.status ==
                            FavoriteRequestStatus.itemRemoved) {
                          mediaDetails.id = null;
                          mediaDetails.isAdded = false;
                        } else if (state.status ==
                                FavoriteRequestStatus.isItemAdded &&
                            state.id != -1) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        }
                      },
                      builder: (context, state) {
                        return Icon(
                          FontAwesomeIcons.heart,
                          color: mediaDetails.isAdded
                              ? AppColors.primary
                              : AppColors.secondaryText,
                          size: AppSize.s20,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
