import 'package:movies_tv/core/resources/all_import.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.search,
            style: textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p6),
            child: Text(
              AppStrings.searchText,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
