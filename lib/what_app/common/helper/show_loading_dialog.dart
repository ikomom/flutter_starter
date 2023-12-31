import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';


showLoadingDialog({
  required BuildContext context,
  required String message,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CircularProgressIndicator(
                  color: Colours.greenDark,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 15,
                      color: context.theme.grayColor,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
