import 'package:flutter/material.dart';

import '../constant/size_constant.dart';

extension PaddingExtension on BuildContext {
  double get kZero => 0.0;
  EdgeInsets get pagePadding => EdgeInsets.all(SizeConstant.instance.pagePadding);
  EdgeInsets get zeroPadding => EdgeInsets.zero;
  EdgeInsets get normalPadding => EdgeInsets.all(normalVal);
  EdgeInsets get heighPadding => EdgeInsets.all(heighVal);
  double get normalVal => 8.0;
  double get heighVal => 14.0;

  EdgeInsets dynamicAllPadding(double value) => EdgeInsets.all(value);
  EdgeInsets dynamicSymmetricPadding(double? horizontal, double? vertical) =>
      EdgeInsets.symmetric(horizontal: horizontal ?? 0.0, vertical: vertical ?? kZero);
  EdgeInsets dynamicOnlyPadding({double? top, double? bottom, double? right, double? left}) =>
      EdgeInsets.only(bottom: bottom ?? kZero, top: top ?? kZero, left: left ?? kZero, right: right ?? kZero);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get border20Radius => BorderRadius.circular(20.0);
  BorderRadius get border25Radius => BorderRadius.circular(25.0);
  BorderRadius get border10Radius => BorderRadius.circular(10.0);
  BorderRadius get borderVertical10Radius => const BorderRadius.vertical(top: Radius.circular(10.0));
}

extension MediaQuerySizeExtension on BuildContext {
  Size get mediaQuery => MediaQuery.of(this).size;
  double get colorPaletteHeight => mediaQuery.height * 0.045;
  double get height => mediaQuery.height;
  double get width => mediaQuery.width;
  double get searchTextHeight => height * 0.05; //x
  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(seconds: 1);
  Duration get mediumDuration => const Duration(seconds: 2);
  Duration get normalDuration => const Duration(seconds: 3);
  Duration get heighDuration => const Duration(seconds: 4);
}
