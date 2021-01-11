import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/default_style.dart';
import '../vendors/spinkits/bounce.dart';
import '../vendors/spinkits/circle.dart';

class Loading {
  ///需要引入Bot_Toast插件，参考 https://pub.flutter-io.cn/packages/bot_toast
  static CancelFunc show({String message, int seconds, Color backgroundColor, Widget child}) {
    Widget current = child ??
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SpinKitBounce(color: Colors.white, size: 30.0),
                  message == null
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                          child: Text(message, style: TextStyle(color: Colors.white, fontSize: 16.0)),
                        ),
                ],
              ),
            ],
          ),
        );

    return BotToast.showCustomLoading(
        clickClose: false,
        allowClick: false,
        ignoreContentClick: true,
        duration: seconds == null ? null : Duration(seconds: seconds),
        backgroundColor: backgroundColor ?? DefaultStyle.maskColor,
        align: Alignment.center,
        toastBuilder: (cancelFunc) {
          return Center(child: current);
        });
  }

  static void hide() {
    BotToast.closeAllLoading();
  }

  static Widget showIndicator({Color color, double size}) {
    return SpinKitCircle(color: color ?? DefaultStyle.blue, size: size ?? 36.0);
  }
}
