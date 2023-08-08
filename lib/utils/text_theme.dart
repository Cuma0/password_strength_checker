import 'package:flutter/material.dart';

import 'color_scheme.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle titleLarge = TextStyle(
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w600,
    fontSize: 36,
    color: ColorSchemeLight.instance!.black,
  );

  final TextStyle titleMedium = TextStyle(
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorSchemeLight.instance!.lightBlack,
  );

  final TextStyle bodyMedium = TextStyle(
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorSchemeLight.instance!.lightBlack,
  );

  final TextStyle bodySmall = TextStyle(
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: ColorSchemeLight.instance!.grey,
  );

  final TextStyle button = TextStyle(
    fontFamily: "JosefinSans",
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorSchemeLight.instance!.black,
  );
}
