import 'package:flutter/material.dart';

extension StringExtension on String {
  ///字符串是否是纯数字
  bool get isNumber {
    RegExp regex = RegExp(r'^\d+$');
    return regex.hasMatch(this);
  }

  ///根据字符串的UTF-16的值转为颜色
  Color get toColor {
    var number = 0.0;
    for (var i = 0; i < length; i++) {
      number += codeUnitAt(i);
    }
    number = (number % 10) * 25.5;
    return HSLColor.fromAHSL(1, number, 1, 0.35).toColor();
  }

  ///根据字符串的UTF-16的值转为颜色(淡色)
  Color get toLightColor {
    var number = 0.0;
    for (var i = 0; i < length; i++) {
      number += codeUnitAt(i);
    }
    number = (number % 10) * 25.5;
    return HSLColor.fromAHSL(1, number, 1, 0.66).toColor();
  }

  ///移除字符串前面指定的参数
  String trimStart(String chars) {
    var value = this;

    while (value.startsWith(chars)) value = value.substring(chars.length);

    return value;
  }

  ///移除字符串后面指定的参数
  String trimEnd(String chars) {
    var value = this;

    while (value.endsWith(chars)) value = value.substring(0, value.length - chars.length);

    return value;
  }

  ///从指定位置开始截取指定长度的字符串
  String sub({int start = 0, int length}) {
    var source = this;

    if (source == null) return '';

    if (length == null) length = source.length;

    int sourceLength = source.length;

    if (sourceLength - start <= length) return source.substring(start);

    return source.substring(start, length + start);
  }

  bool get isNullOrEmpty {
    var value = this;

    return value == null || value.isEmpty || value.trim() == '';
  }
}
