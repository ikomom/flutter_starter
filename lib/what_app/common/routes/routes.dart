import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/feature/auth/pages/login_page.dart';
import 'package:flutter_starter/what_app/feature/auth/pages/user_info_page.dart';
import 'package:flutter_starter/what_app/feature/auth/pages/verification_page.dart';
import 'package:flutter_starter/what_app/feature/home/home_page.dart';
import 'package:flutter_starter/what_app/feature/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'userInfo';
  static const String home = 'home';

  static pop<T extends Object?>(BuildContext context, [T? result]) {
    return Navigator.of(context).pop<T>(result);
  }

  static Future<T?> push<T extends Object?>(BuildContext context, String name,
      {Map? arguments, RoutePredicate? predicate}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      predicate ?? (route) => false, // false 即移除所有之前的路由，包括当前路由。
      arguments: arguments,
    );
  }

  static Future<T?> pushBuilder<T extends Object?>(BuildContext context, Widget widget) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => widget));
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    final Map args = settings.arguments as Map;
    switch (settings.name) {
      case welcome:
        builder = (context) => const WelComePage();
      case login:
        builder = (context) => const LoginPage();
      case verification:
        final Map args = settings.arguments as Map;
        builder = (context) => VerificationPage(
              smsCodeId: args['smsCodeId'],
              phoneNumber: args['phoneNumber'],
            );
      case userInfo:
        builder = (context) => const UserInfoPage();
      case home:
        builder = (context) => const HomePage();
      default:
        builder = (context) => const Scaffold(
              body: Center(
                child: Text('No Page Route Provide'),
              ),
            );
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }
}
