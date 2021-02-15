import 'package:intl/intl.dart';

class DateTimeFormatter {
  static const String yyyyMMddHHmmss = 'yyyy-MM-dd HH:mm:ss';
  static const String yyyyMMddHHmm = 'yyyy-MM-dd HH:mm';
  static const String yyyyMMdd = 'yyyy-MM-dd';
  static const String yyMMddHHmmss = 'yy-MM-dd HH:mm:ss';
  static const String yyMMddHHmm = 'yy-MM-dd HH:mm';
  static const String yyMMdd = 'yy-MM-dd';

  static const String mmddyyyyHHmmss = 'MM-dd-yyyy HH:mm:ss';
  static const String mmddyyyyHHmm = 'MM-dd-yyyy HH:mm';
  static const String mmddyyyy = 'MM-dd-yyyy';
  static const String mmddyyHHmmss = 'MM-dd-yy HH:mm:ss';
  static const String mmddyyHHmm = 'MM-dd-yy HH:mm';
  static const String mmddyy = 'MM-dd-yy';

  static const String mmddHHmmss = 'MM-dd HH:mm:ss';
  static const String mmddHHmm = 'MM-dd HH:mm';

  static const String hhmmss = 'HH:mm:ss';
}

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

  String format({DateTime dateTime, String formatter}) {
    DateTime dt = dateTime ?? this;
    formatter = formatter ?? DateTimeFormatter.yyyyMMddHHmmss;

    return DateFormat(formatter).format(dt);
  }

  static String _z(int i) => i < 10 ? '0${i.toString()}' : i.toString();
}
