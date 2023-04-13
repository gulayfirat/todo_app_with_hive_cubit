enum LottieItems { splash }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.splash:
        return 'splash';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
