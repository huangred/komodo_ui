import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';
import 'navigation.dart';

class ScreenHelper {
  /// 屏幕宽
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  /// 屏幕高
  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  ///状态栏高度
  static double get statusBarHeight {
    double height = MediaQueryData.fromWindow(ui.window).padding.top;
    return height;
  }

  ///底部安全距离高度
  static double get bottomPadding {
    double height = MediaQuery.of(Navigation.context).padding.bottom;

    return height;
  }
}
