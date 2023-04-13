

import 'package:flutter/material.dart';

class ColorSchemeDark {

  ColorSchemeDark._init();
  static ColorSchemeDark? _instace;
  static ColorSchemeDark? get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace;
  }
final Color primaryColor = const Color(0xffF49D1A);
}
