
import 'package:movies_tv/core/presentation/components/vertical_listview.dart';
import 'package:movies_tv/core/utils/enums.dart';
import 'package:movies_tv/core/resources/all_import.dart';
class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PopularMoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.popularMovies,
        ),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return PopularMoviesWidget(movies: state.movies);
              case GetAllRequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<PopularMoviesBloc>()
                        .add(GetPopularMoviesEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return PopularMoviesWidget(movies: state.movies);
            }
          },
        ),
      ),
    );
  }
}

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Media> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
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
                .read<PopularMoviesBloc>()
                .add(FetchMorePopularMoviesEvent());
          },
        );
      },
    );
  }
}
