import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/feature/welcome/widgets/Privacy_and_terms.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_elevated_button.dart';
import 'package:flutter_starter/what_app/feature/welcome/widgets/language_button.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({super.key});

  navigateToLoginPage(context) {
    Routes.push(context, Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  'assets/images/marketing.png',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const PrivacyAndTerms(),
                CustomElevatedButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () {
                    navigateToLoginPage(context);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const LanguageButton(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
