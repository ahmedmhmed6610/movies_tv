import 'package:movies_tv/core/presentation/components/vertical_listview.dart';
import 'package:movies_tv/core/utils/enums.dart';

import 'package:movies_tv/core/resources/all_import.dart';

class PopularTVShowsView extends StatelessWidget {
  const PopularTVShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PopularTVShowsBloc>()..add(GetPopularTVShowsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.popularShows,
        ),
        body: BlocBuilder<PopularTVShowsBloc, PopularTVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return PopularTVShowsWidget(tvShows: state.tvShows);
              case GetAllRequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<PopularTVShowsBloc>()
                        .add(GetPopularTVShowsEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return PopularTVShowsWidget(tvShows: state.tvShows);
            }
          },
        ),
      ),
    );
  }
}

class PopularTVShowsWidget extends StatelessWidget {
  const PopularTVShowsWidget({
    super.key,
    required this.tvShows,
  });

  final List<Media> tvShows;

  @override
  Widget build(BuildContext context) {
    return VerticalListView(
      itemCount: tvShows.length + 1,
      itemBuilder: (context, index) {
        if (index < tvShows.length) {
          return VerticalListViewCard(media: tvShows[index]);
        } else {
          return const LoadingIndicator();
        }
      },
      addEvent: () {
        context.read<PopularTVShowsBloc>().add(FetchMorePopularTVShowsEvent());
      },
    );
  }
}
