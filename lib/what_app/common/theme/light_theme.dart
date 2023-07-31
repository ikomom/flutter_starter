import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: Colours.backgroundLight,
    // colorScheme: base.colorScheme.copyWith(background: Colours.backgroundLight),
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colours.backgroundLight,
        systemNavigationBarColor: Colours.backgroundLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.greenLight,
        foregroundColor: Colours.backgroundLight,
        // 阴影
        elevation: 0,
        shadowColor: Colors.transparent,
        // 禁用涟漪
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colours.backgroundLight,
      modalBackgroundColor: Colours.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: Colours.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
