import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../utils/screen_helper.dart';
import '../utils/navigation.dart';
import '../style/default_style.dart';

enum AlertResult {
  ok,
  cancel,
}

enum ActionType {
  oK,
  cancel,
  oK_Cancel,
}

class MessageBox {
  static Widget _renderCancelButton(BuildContext context, String cancelText, {bool showRightBorder = true}) {
    Widget btnCancel = Container(
      decoration: new BoxDecoration(
          border: Border(right: BorderSide(width: showRightBorder ? 0.5 : 0.0, color: Theme.of(context).dividerColor))),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: Colors.transparent,
        child: Text(cancelText),
        onPressed: () => Navigator.of(context).pop(AlertResult.cancel),
      ),
    );

    return btnCancel;
  }

  static Widget _renderOKButton(BuildContext context, String okText) {
    Widget btnOK = Container(
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        color: Colors.transparent,
        child: Text(okText),
        onPressed: () => Navigator.of(context).pop(AlertResult.ok),
      ),
    );

    return btnOK;
  }

  static Future<AlertResult> show({
    String title = '提示',
    String content,
    TextStyle contentTextStyle,
    Widget child,
    String cancelText = '取消',
    String okText = '确定',
    ActionType action = ActionType.oK_Cancel,
  }) {
    return showDialog(
      context: Navigation.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        List<Widget> buttons = List<Widget>();
        if (action == ActionType.cancel) buttons.add(_renderCancelButton(context, cancelText, showRightBorder: false));
        if (action == ActionType.oK) buttons.add(_renderOKButton(context, okText));
        if (action == ActionType.oK_Cancel) {
          buttons.add(_renderCancelButton(context, cancelText));
          buttons.add(_renderOKButton(context, okText));
        }

        Widget actions = buttons.length == 1
            ? Row(children: <Widget>[Expanded(child: buttons[0])])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Expanded(flex: 1, child: buttons[0]), Expanded(flex: 1, child: buttons[1])],
              );

        Widget current = Center(
            child: Container(padding: EdgeInsets.only(left: 24, right: 24, bottom: 24), child: child ?? Text(content)));

        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DefaultStyle.radiusNormal)),
          title: Center(child: Text(title, style: TextStyle(fontSize: DefaultStyle.fontSizeLarge))),
          titlePadding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
          contentTextStyle: contentTextStyle,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[current, Divider(height: 1), actions],
          ),
        );
      },
    );
  }

  static Future<AlertResult> alert({
    String title = '提示',
    String content,
    TextStyle contentTextStyle,
    Widget child,
    String cancelText = '取消',
    String okText = '确定',
  }) {
    return show(
        title: title,
        content: content,
        contentTextStyle: contentTextStyle,
        child: child,
        cancelText: cancelText,
        okText: okText);
  }

  ///需要引入Bot_Toast插件，参考 https://pub.flutter-io.cn/packages/bot_toast
  static void showTip(
      {String message,
      int seconds,
      Widget child,
      Alignment align,
      EdgeInsets padding,
      Color backgroundColor,
      TextStyle textStyle}) {
    BotToast.showCustomText(
      duration: seconds == null ? null : Duration(seconds: seconds),
      align: align ?? Alignment(0, 0),
      clickClose: true,
      toastBuilder: (_) => Container(
        constraints: BoxConstraints(maxWidth: ScreenHelper.width * 0.8),
        padding: padding ?? EdgeInsets.all(DefaultStyle.intervalNormal),
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFF323232), //Colors.black87,
          borderRadius: BorderRadius.circular(DefaultStyle.radiusNormal),
        ),
        child: child ??
            Text(
              message,
              style: textStyle ?? TextStyle(height: 1.2, fontSize: DefaultStyle.fontSizeNormal, color: Colors.white),
              textAlign: TextAlign.left,
            ),
      ),
    );
  }
}
