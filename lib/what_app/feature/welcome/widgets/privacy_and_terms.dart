
import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Read our',
              style: TextStyle(color: context.theme.grayColor, height: 1.8),
              children: [
                TextSpan(text: ' Privacy Policy ', style: TextStyle(color: context.theme.blueColor)),
                const TextSpan(text: 'Tap "Agree and continue" to accept the '),
                TextSpan(text: 'Term of service', style: TextStyle(color: context.theme.blueColor)),
              ])),
    );
  }
}
