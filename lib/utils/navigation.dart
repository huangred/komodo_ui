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

  static Future pushNamed(String routeName, {Object arguments}) async => await navigatorKey.currentState.pushNamed(routeName, arguments: arguments);

  static Future pushReplacementNamed(String routeName, {Object arguments}) async => await navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);

  static Future pushNamedAndRemoveUntil(String routeName, {Object arguments}) async {
    return await navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (route) => route == null, arguments: arguments);
  }

  static Future open(
    Widget page, {
    RouteType type = RouteType.slide,
    Duration duration = const Duration(milliseconds: 300),
    bool opaque = false,
    Color barrierColor = Colors.transparent,
    Offset begin,
  }) async {
    Route route;

    switch (type) {
      case RouteType.slide:
        route = SlideRoute(page, duration: duration, opaque: opaque, barrierColor: barrierColor, begin: Offset(1.0, 0.0));
        break;
      case RouteType.popUp:
        route = PopUpRoute(page, duration: duration, opaque: opaque, barrierColor: barrierColor, begin: Offset(0.0, 1.0));
        break;
      case RouteType.fade:
        route = FadeRoute(page, duration: duration, opaque: opaque, barrierColor: barrierColor);
        break;
      case RouteType.none:
        route = MaterialPageRoute(builder: (context) => page);
        break;
      default:
        route = SlideRoute(page, duration: duration, opaque: opaque, barrierColor: barrierColor);
        break;
    }

    return await Navigator.push(Navigation.context, route);
  }
}

enum RouteType {
  none,
  popUp,
  slide,
  fade,
}

class PopUpRoute extends PageRouteBuilder {
  final Widget widget;
  PopUpRoute(
    this.widget, {
    Duration duration = const Duration(milliseconds: 300),
    bool opaque = false,
    Color barrierColor = Colors.transparent,
    Offset begin = const Offset(0.0, 1.0),
  }) : super(
            transitionDuration: duration,
            opaque: opaque,
            barrierColor: barrierColor,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => widget,
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: Offset(0.0, 0.0),
                ).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

class SlideRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRoute(
    this.widget, {
    Duration duration = const Duration(milliseconds: 300),
    bool opaque = false,
    Color barrierColor = Colors.transparent,
    Offset begin = const Offset(1.0, 0.0),
  }) : super(
            transitionDuration: duration,
            opaque: opaque,
            barrierColor: barrierColor,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => widget,
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: begin,
                  end: Offset(0.0, 0.0),
                ).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

class FadeRoute extends PageRouteBuilder {
  final Widget widget;
  FadeRoute(this.widget, {Duration duration = const Duration(milliseconds: 300), bool opaque = false, Color barrierColor = Colors.transparent})
      : super(
            transitionDuration: duration,
            opaque: opaque,
            barrierColor: barrierColor,
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => widget,
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                  opacity: CurvedAnimation(
                    parent: animation,
                    curve: Curves.linear,
                  ),
                  child: child);
            });
}
