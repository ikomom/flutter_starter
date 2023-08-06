import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_starter/what_app/common/extension/custom_theme_extension.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    scaffoldBackgroundColor: Colours.backgroundDark,
    // colorScheme: base.colorScheme.copyWith(background: Colours.backgroundDark),
    extensions: [
      CustomThemeExtension.darkMode,
    ],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colours.grayBackgroundDark,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colours.grayDark,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colours.backgroundDark,
      ),
      iconTheme: IconThemeData(
        color: Colours.grayDark,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colours.greenDark, width: 2),
      ),
      unselectedLabelColor: Colours.grayDark,
      labelColor: Colours.greenDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.greenDark,
        foregroundColor: Colours.backgroundDark,
        // 阴影
        elevation: 0,
        shadowColor: Colors.transparent,
        // 禁用涟漪
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colours.grayBackgroundDark,
      modalBackgroundColor: Colours.grayBackgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: Colours.grayBackgroundDark,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colours.greenDark,
      foregroundColor: Colors.white,
    ),
  );
}
