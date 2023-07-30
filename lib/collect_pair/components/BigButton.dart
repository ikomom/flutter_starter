import 'package:flutter/material.dart';

class BigBtn extends StatelessWidget {
  const BigBtn(
      {super.key,
        required this.onPressed,
        required this.buttonText,
        this.icon});

  final void Function()? onPressed;
  final String buttonText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall
        ?.copyWith(color: theme.colorScheme.onPrimary, fontSize: 22);

    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: icon == null
            ? ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: textStyle,
            ))
            : ElevatedButton.icon(
            icon: Icon(
              icon,
              size: 18,
            ),
            onPressed: onPressed,
            label: Text(
              buttonText,
              style: textStyle,
            )));
  }
}
