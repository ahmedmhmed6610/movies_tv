import 'package:movies_tv/core/resources/all_import.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        controller: _textController,
        cursorColor: AppColors.primaryText,
        cursorWidth: AppSize.s1,
        style: textTheme.bodyLarge,
        onChanged: (title) {
          context.read<SearchBloc>().add(GetSearchResultsEvent(title));
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryText,
            ),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryText,
            ),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.primaryText,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.text = '';
              context.read<SearchBloc>().add(const GetSearchResultsEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: AppColors.primaryText,
            ),
          ),
          hintText: AppStrings.searchHint,
          hintStyle: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
