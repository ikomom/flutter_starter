import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/collect_pair/MyAppState.dart';
import 'package:flutter_starter/collect_pair/components/BigButton.dart';
import 'package:provider/provider.dart';


class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, this.buttonText = 'favorite', this.text});
  final String buttonText;
  final WordPair? text;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return  BigBtn(
        icon: appState.hasFavorite(text)
            ? Icons.favorite
            : Icons.favorite_border,
        onPressed: () => appState.toggleFavorite(text),
        buttonText: buttonText);
  }
}
