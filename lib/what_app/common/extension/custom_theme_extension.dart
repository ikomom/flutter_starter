import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/utils/colours.dart';

extension ExtenededTheme on BuildContext {
  CustomThemeExtension get theme => Theme.of(this).extension<CustomThemeExtension>()!;
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static var lightMode = CustomThemeExtension(
    circleImageColor: const Color(0xFF25D366),
    grayColor: Colours.grayLight,
    blueColor: Colours.blueLight,
    langBtnBgColor: const Color(0xFFF1F1F1),
    langBtnHighlightColor: const Color(0xFFE8E8ED),
    authAppBarTextColor: Colours.greenLight,
    photoIconBgColor: const Color(0xFFF0F2F3),
    photoIconColor: const Color(0xFF9DAAB3),
  );
  static var darkMode = CustomThemeExtension(
    circleImageColor: Colours.greenDark,
    grayColor: Colours.grayDark,
    blueColor: Colours.blueDark,
    langBtnBgColor: const Color(0xFF182229),
    langBtnHighlightColor: const Color(0xFF09141A),
    authAppBarTextColor: const Color(0xFFE9EDEF),
    photoIconColor: const Color(0xFF61717B),
    photoIconBgColor: const Color(0xFF283339),
  );

  final Color? circleImageColor;
  final Color? grayColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppBarTextColor;
  final Color? photoIconColor;
  final Color? photoIconBgColor;

  CustomThemeExtension({
    this.circleImageColor,
    this.grayColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
    this.authAppBarTextColor,
    this.photoIconColor,
    this.photoIconBgColor,
  });

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? circleImageColor,
    Color? grayColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
    Color? authAppBarTextColor,
  }) {
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      grayColor: grayColor ?? this.grayColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor: langBtnHighlightColor ?? this.langBtnHighlightColor,
      authAppBarTextColor: authAppBarTextColor ?? this.authAppBarTextColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      grayColor: Color.lerp(grayColor, other.grayColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighlightColor: Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
      authAppBarTextColor: Color.lerp(authAppBarTextColor, other.authAppBarTextColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
    );
  }
}
