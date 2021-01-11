import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

///需要如下初始化
///Widget build(BuildContext context) {
///   return MaterialApp(
///     builder: Navigation.botToastInit(),
///     navigatorKey: Navigation.navigatorKey,
///     navigatorObservers: [BotToastNavigatorObserver()],
///     ......
///   )
/// }
class Navigation {
  static botToastInit() => BotToastInit();
  static botToastNavigatorObserver() => BotToastNavigatorObserver();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => Navigation.navigatorKey.currentState.overlay.context;

  static Future pop({dynamic arg}) async => navigatorKey.currentState.pop(arg);

  static Future pushNamed(String routeName, {Object arguments}) async =>
      await navigatorKey.currentState.pushNamed(routeName, arguments: arguments);

  static Future pushReplacementNamed(String routeName, {Object arguments}) async =>
      await navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);

  static Future pushNamedAndRemoveUntil(String routeName, {Object arguments}) async {
    return await navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (route) => route == null, arguments: arguments);
  }

  static Future openPage(Widget page) async {
    return await Navigator.push(Navigation.context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  static Future openTransparentPage(Widget page) async {
    var ret = await Navigator.of(Navigation.context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      ),
    );
    return ret;
  }
}
