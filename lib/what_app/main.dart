import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/what_app/common/helper/feature_watch.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/theme/dark_theme.dart';
import 'package:flutter_starter/what_app/common/theme/light_theme.dart';
import 'package:flutter_starter/what_app/feature/auth/controller/auth_controller.dart';
import 'package:flutter_starter/what_app/feature/home/pages/home_page.dart';
import 'package:flutter_starter/what_app/feature/welcome/pages/welcome_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

Widget HomeIndex(BuildContext context, WidgetRef ref) {
  return featureWatch(
    context: context,
    ref: ref,
    provider: userInfoAuthProvider,
    data: (user) {
      if (user == null) return const WelComePage();
      return const HomePage();
    },
  );
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
      home: HomeIndex(context, ref),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
