import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Text(
            message,
            style: TextStyle(
              color: context.theme.grayColor,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                btnText ?? 'OK',
                style: TextStyle(color: context.theme.circleImageColor),
              ),
            ),
          ],
        );
      });
}
