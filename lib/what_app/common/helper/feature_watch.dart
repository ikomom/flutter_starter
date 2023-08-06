import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget featureWatch<T>({
  required BuildContext context,
  required WidgetRef ref,
  required FutureProvider<T> provider,
  required Widget Function(T data) data,
}) {
  return ref.watch(provider).when(
        data: data,
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text('Something wrong happen'),
            ),
          );
        },
        loading: () {
          return Scaffold(
            body: Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ),
            ),
          );
        },
      );
}
