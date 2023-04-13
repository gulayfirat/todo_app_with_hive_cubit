import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeDark {
  TextThemeDark._init();
  static TextThemeDark? _instance;
  static TextThemeDark? get instance {
    _instance ??= TextThemeDark._init();
    return _instance;
  }

  final TextStyle headline1 = GoogleFonts.roboto(fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: Colors.white);
  final TextStyle headline2 = GoogleFonts.roboto(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: Colors.white);
  final TextStyle headline3 = GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.white);
  final TextStyle headline4 = GoogleFonts.roboto(fontSize: 34, fontWeight: FontWeight.w500, letterSpacing: 0.25, color: const Color(0xffF49D1A));
  final TextStyle headline5 = GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white);
  final TextStyle headline6 = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.white);
  final TextStyle subtitle1 = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.white);
  final TextStyle subtitle2 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: Colors.white);
  final TextStyle bodyText1 = GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.black);
  final TextStyle bodyText2 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.white);
  final TextStyle button = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: Colors.white);
  final TextStyle caption =
      GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: const Color.fromARGB(255, 72, 71, 71));
  final TextStyle overline = GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: Colors.white);
}
