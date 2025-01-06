import 'package:movies_tv/core/presentation/components/custom_slider.dart';
import 'package:movies_tv/core/presentation/components/section_header.dart';
import 'package:movies_tv/core/presentation/components/section_listview.dart';
import 'package:movies_tv/core/presentation/components/section_listview_card.dart';
import 'package:movies_tv/core/presentation/components/slider_card.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/core/resources/all_import.dart';
class TVShowsView extends StatelessWidget {
  const TVShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TVShowsBloc>()..add(GetTVShowsEvent()),
      child: Scaffold(
        body: BlocBuilder<TVShowsBloc, TVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return TVShowsWidget(
                  onAirTvShows: state.tvShows[0],
                  popularTvShows: state.tvShows[1],
                  topRatedTvShows: state.tvShows[2],
                );
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context.read<TVShowsBloc>().add(GetTVShowsEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class TVShowsWidget extends StatelessWidget {
  const TVShowsWidget({
    super.key,
    required this.onAirTvShows,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });

  final List<Media> onAirTvShows;
  final List<Media> popularTvShows;
  final List<Media> topRatedTvShows;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, _) {
              return SliderCard(
                media: onAirTvShows[itemIndex],
                itemIndex: itemIndex,
              );
            },
          ),
          SectionHeader(
            title: AppStrings.popularShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularTvShowsRoute);
            },
          ),
          SectionListView(
            height: AppSize.s240,
            itemCount: popularTvShows.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: popularTvShows[index]);
            },
          ),
          SectionHeader(
            title: AppStrings.topRatedShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.topRatedTvShowsRoute);
            },
          ),
          SectionListView(
            height: AppSize.s240,
            itemCount: topRatedTvShows.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: topRatedTvShows[index]);
            },
          ),
        ],
      ),
    );
  }
}
