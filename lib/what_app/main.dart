import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';
import 'package:flutter_starter/what_app/common/theme/dark_theme.dart';
import 'package:flutter_starter/what_app/common/theme/light_theme.dart';
import 'package:flutter_starter/what_app/feature/welcome/pages/welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'WhatsApp Me',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const WelComePage(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
