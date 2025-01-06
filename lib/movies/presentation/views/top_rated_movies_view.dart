import 'package:movies_tv/core/presentation/components/vertical_listview.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/core/resources/all_import.dart';
class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TopRatedMoviesBloc>()..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.topRatedMovies,
        ),
        body: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return TopRatedMoviesWidget(movies: state.movies);
              case GetAllRequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<TopRatedMoviesBloc>()
                        .add(GetTopRatedMoviesEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return TopRatedMoviesWidget(movies: state.movies);
            }
          },
        ),
      ),
    );
  }
}

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Media> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
      builder: (context, state) {
        return VerticalListView(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return VerticalListViewCard(media: movies[index]);
            } else {
              return const LoadingIndicator();
            }
          },
          addEvent: () {
            context
                .read<TopRatedMoviesBloc>()
                .add(FetchMoreTopRatedMoviesEvent());
          },
        );
      },
    );
  }
}
