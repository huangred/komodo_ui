extension DateTimeExtension on DateTime {
  bool operator <(DateTime other) {
    return millisecondsSinceEpoch < other.millisecondsSinceEpoch;
  }

  bool operator >(DateTime other) {
    return millisecondsSinceEpoch > other.millisecondsSinceEpoch;
  }

  bool operator >=(DateTime other) {
    return millisecondsSinceEpoch >= other.millisecondsSinceEpoch;
  }

  bool operator <=(DateTime other) {
    return millisecondsSinceEpoch <= other.millisecondsSinceEpoch;
  }

  static final minutesBetweenEnvironments = 5;
  bool sameEnvironment(DateTime prevTime) {
    return millisecondsSinceEpoch - prevTime.millisecondsSinceEpoch < 1000 * 60 * minutesBetweenEnvironments;
  }

  String toTimeline({bool showTime = true}) {
    var now = DateTime.now();

    var sameYear = now.year == year;

    var sameDay = sameYear && now.month == month && now.day == day;

    var time = '${_z(hour)}:${_z(minute)}';

    if (sameDay) return '今天' + (showTime ? ' $time' : '');

    if (now.add(Duration(days: -1)).day == day) return '昨天' + (showTime ? ' $time' : '');

    if (sameYear) return '${_z(month)}月${_z(day)}日' + (showTime ? ' $time' : '');

    return '${year.toString().substring(2)}年${_z(month)}月${_z(day)}日' + (showTime ? ' $time' : '');
  }

  String toTime() {
    var time = '${_z(hour)}:${_z(minute)}';

    return time;
  }

  static String _z(int i) => i < 10 ? '0${i.toString()}' : i.toString();
}
