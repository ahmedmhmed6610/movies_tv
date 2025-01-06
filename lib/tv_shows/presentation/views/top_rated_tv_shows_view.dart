import 'package:movies_tv/core/presentation/components/vertical_listview.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/core/resources/all_import.dart';
class TopRatedTVShowsView extends StatelessWidget {
  const TopRatedTVShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TopRatedTVShowsBloc>()..add(GetTopRatedTVShowsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.topRatedShows,
        ),
        body: BlocBuilder<TopRatedTVShowsBloc, TopRatedTVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return TopRatedTVShowsWidget(tvShows: state.tvShows);
              case GetAllRequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<TopRatedTVShowsBloc>()
                        .add(GetTopRatedTVShowsEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return TopRatedTVShowsWidget(tvShows: state.tvShows);
            }
          },
        ),
      ),
    );
  }
}

class TopRatedTVShowsWidget extends StatelessWidget {
  const TopRatedTVShowsWidget({
    super.key,
    required this.tvShows,
  });

  final List<Media> tvShows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalListView(
        itemCount: tvShows.length + 1,
        itemBuilder: (context, index) {
          if (index < tvShows.length) {
            return VerticalListViewCard(media: tvShows[index]);
          } else {
            return const LoadingIndicator();
          }
        },
        addEvent: () {
          context
              .read<TopRatedTVShowsBloc>()
              .add(FetchMoreTopRatedTVShowsEvent());
        },
      ),
    );
  }
}
