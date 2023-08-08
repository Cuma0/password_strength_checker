import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color blue = const Color(0xff94E6FA);
  final Color darkBlue = const Color(0xff79E3FD);

  final Color black = const Color(0xff242424);
  final Color lightBlack = const Color(0xff4D4D4D);

  final Color lightGrey = const Color(0xffF0F0F0);
  final Color grey = const Color(0xffD3D3D3);
  final Color darkGrey = const Color(0xff8B8B8B);
}
