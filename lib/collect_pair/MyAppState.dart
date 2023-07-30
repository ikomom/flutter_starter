import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  bool hasFavorite([text]) {
    return favorites.contains(text ?? current);
  }

  void toggleFavorite([text]) {
    var cur = text ?? current;
    if (hasFavorite(text)) {
      favorites.remove(cur);
    } else {
      favorites.add(cur);
    }
    notifyListeners();
  }

  var extended = false;

  void toggleExtended([bool? extend]) {
    if (extend != null) {
      extended = !!extend;
    } else {
      extended = !extended;
    }
    print(extended);
    notifyListeners();
  }
}
