import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/theme/dark_theme.dart';
import 'package:flutter_starter/what_app/common/theme/light_theme.dart';
import 'package:flutter_starter/what_app/feature/auth/controller/auth_controller.dart';
import 'package:flutter_starter/what_app/feature/auth/pages/user_info_page.dart';
import 'package:flutter_starter/what_app/feature/home/home_page.dart';
import 'package:flutter_starter/what_app/feature/welcome/pages/welcome_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'WhatsApp Me',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: ref.watch(userInfoAuthProvider).when(data: (user) {
        if (user == null) return const WelComePage();
        return const HomePage();
      }, error: (error, trace) {
        return const Scaffold(
          body: Center(
            child: Text('Something wrong happen'),
          ),
        );
      }, loading: () {
        return Scaffold(
          body: Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
              ),
            ),
          ),
        );
      }),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
