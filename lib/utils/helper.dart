class Helper {
  ///将总秒数格式化成 hh:mm:ss
  static String formatDuration(int seconds) {
    if (seconds == null) return '';

    int h = 0, m = 0, s = 0;

    if (seconds <= 59) return "00:" + _f(seconds);

    m = seconds ~/ 60;
    s = seconds % 60;
    if (m <= 59) return _f(m) + ":" + _f(s);

    h = m ~/ 60;
    m = m % 60;
    return _f(h) + ":" + _f(m) + ":" + _f(s);
  }

  static String _f(int digit) => digit.toString().padLeft(2, '0');
}
