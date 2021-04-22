import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';

class ScreenHelper {
  /// 屏幕宽
  static double get width => MediaQueryData.fromWindow(ui.window).size.width;

  /// 屏幕高
  static double get height => MediaQueryData.fromWindow(ui.window).size.height;

  ///状态栏高度
  static double get statusBarHeight => MediaQueryData.fromWindow(ui.window).padding.top;

  ///标题栏高度
  static double get toolBarHeight => kToolbarHeight;

  ///底部安全距离高度
  static double get bottomPadding => MediaQueryData.fromWindow(ui.window).padding.bottom;
}
