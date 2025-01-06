import 'package:movies_tv/core/resources/all_import.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoriteBloc>()..add(GetWatchListItemsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.watchlist,
        ),
        body: BlocBuilder<FavoriteBloc, WatchlistState>(
          builder: (context, state) {
            if (state.status == FavoriteRequestStatus.loading) {
              return const LoadingIndicator();
            } else if (state.status == FavoriteRequestStatus.loaded) {
              return WatchlistWidget(items: state.items);
            } else if (state.status == FavoriteRequestStatus.empty) {
              return const EmptyFavoriteText();
            } else {
              return ErrorScreen(
                onTryAgainPressed: () {
                  context.read<FavoriteBloc>().add(GetWatchListItemsEvent());
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({
    super.key,
    required this.items,
  });

  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p6,
      ),
      itemBuilder: (context, index) {
        return VerticalListViewCard(media: items[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: AppSize.s10),
    );
  }
}
