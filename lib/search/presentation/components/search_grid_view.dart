import 'package:movies_tv/search/domain/entities/search_result_item.dart';
import 'package:movies_tv/search/presentation/components/grid_view_card.dart';
import 'package:movies_tv/core/resources/all_import.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.results,
  });

  final List<SearchResultItem> results;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        itemCount: results.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          childAspectRatio: 0.55,
        ),
        itemBuilder: (context, index) {
          return GridViewCard(item: results[index]);
        },
      ),
    );
  }
}
