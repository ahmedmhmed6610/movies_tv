import 'package:flutter/material.dart';
import 'package:movies_tv/core/resources/app_strings.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          AppStrings.noResults,
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
