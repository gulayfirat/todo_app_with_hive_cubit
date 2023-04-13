class StringConstant {
  StringConstant._init();
  static StringConstant? _instance;
  static StringConstant get instance {
    _instance ??= StringConstant._init();
    return _instance!;
  }

  final String noteTag = "addNote";
  final String taskTag = "addTask";
}
