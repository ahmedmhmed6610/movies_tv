import 'package:movies_tv/core/resources/all_import.dart';

class EmptyFavoriteText extends StatelessWidget {
  const EmptyFavoriteText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.watchlistIsEmpty,
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p6),
          child: Text(
            AppStrings.watchlistText,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
