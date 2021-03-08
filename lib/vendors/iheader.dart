import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';
import 'package:komodo_ui/utils/navigation.dart';
import '../style/default_style.dart';

class IHeader extends StatelessWidget {
  final Color background;
  final Widget child;
  final Widget middle;
  final Widget actions;
  final Function onBack;
  final double height;
  final EdgeInsetsGeometry margin;

  const IHeader({
    Key key,
    this.background,
    this.child,
    this.middle,
    this.actions,
    this.onBack,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      height: this.height ?? ScreenHelper.toolBarHeight,
      width: double.infinity,
      color: this.background ?? Colors.transparent,
      padding: EdgeInsets.only(left: DefaultStyle.appBarSpace, right: DefaultStyle.appBarSpace),
      margin: this.margin ?? EdgeInsets.only(top: ScreenHelper.statusBarHeight),
      child: _renderChild(),
    );

    return current;
  }

  Widget _renderChild() {
    if (this.child != null) return this.child;

    Widget current = Icon(
      Icons.arrow_back_ios,
      color: DefaultStyle.appBarLeadingCorlor,
      size: DefaultStyle.appBarLeadingSize,
    );

    current = GestureDetector(
      onTap: () => this.onBack == null ? Navigation.pop() : this.onBack.call(),
      child: current,
    );

    current = Row(
      children: [
        current,
        Expanded(child: this.middle ?? SizedBox()),
        this.actions ?? SizedBox(),
      ],
    );
    return current;
  }
}
