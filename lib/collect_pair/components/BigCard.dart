import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      color: theme.colorScheme.primary,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asCamelCase,
          semanticsLabel: '${pair.first} ${pair.second}',
          style: textStyle,
        ),
      ),
    );
  }
}
