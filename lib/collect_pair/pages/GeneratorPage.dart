import 'package:flutter/material.dart';
import 'package:flutter_starter/collect_pair/components/BigButton.dart';
import 'package:flutter_starter/collect_pair/components/BigCard.dart';
import 'package:flutter_starter/collect_pair/pages/shared/FavoriteIcon.dart';
import 'package:provider/provider.dart';

import '../MyAppState.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'A random AWESOME idea: ',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          BigCard(pair: pair),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FavoriteIcon(),
              BigBtn(onPressed: () => appState.getNext(), buttonText: 'next'),
            ],
          ),
        ],
      ),
    );
  }
}
