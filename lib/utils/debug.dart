bool _debugFlag = false;

bool get isDebug {
  assert(() {
    _debugFlag = true;
    return _debugFlag;
  }());
  return _debugFlag;
}

class LogHelper {
  static err(dynamic exception, dynamic stackTrace) {
    print(err.toString());
    if (stackTrace != null) print(stackTrace.toString());
  }
}
