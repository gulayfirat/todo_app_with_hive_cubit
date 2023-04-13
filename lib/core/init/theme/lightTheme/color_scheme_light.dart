import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._init();
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  final Color primaryColor = const Color(0xffF49D1A);
}
