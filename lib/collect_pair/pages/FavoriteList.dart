import 'package:flutter/material.dart';
import 'package:flutter_starter/collect_pair/MyAppState.dart';
import 'package:flutter_starter/collect_pair/pages/shared/FavoriteIcon.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
        padding: const EdgeInsets.all(10),
        children: appState.favorites
            .mapIndexed((index, msg) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('${index + 1}.  '),
                            Text(msg.asCamelCase),
                          ],
                        ),
                        FavoriteIcon(
                          text: msg,
                          buttonText: 'cancel',
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                ))
            .toList());
  }
}
