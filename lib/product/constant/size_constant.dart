class SizeConstant {
  SizeConstant._init();
  static SizeConstant? _instance;
  static SizeConstant get instance {
    _instance ??= SizeConstant._init();
    return _instance!;
  }

  final double pagePadding = 8.0;
  final double noteCardHeight = 0.14;
  final double colorPaletteSize = 25;
  final double textFNotFocusWidth = 0.5;
  final double textFFocusedWidth = 1.3;
}
