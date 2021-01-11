import 'package:flutter/material.dart';
import '../style/default_style.dart';

class ICell extends StatelessWidget {
  final bool isRequired;
  final Color requredColor;

  final Widget customLabel;
  final String label;
  final TextStyle labelStyle;
  final double labelWidth;

  final Widget customContent;
  final String content;
  final TextStyle contentStyle;

  final Widget customTrailing;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final Color backgroundColor;

  final Function onClick;

  final Color trailingColor;
  final double trailingSize;
  final CrossAxisAlignment crossAxisAlignment;
  final bool showTrailing;

  final String hitText;
  final TextStyle hitTextStyle;
  final bool showBottomBorder;

  const ICell({
    this.isRequired,
    this.requredColor,
    this.label,
    this.labelStyle,
    this.labelWidth,
    this.content,
    this.contentStyle,
    this.customLabel,
    this.customContent,
    this.margin,
    this.padding,
    this.onClick,
    this.backgroundColor,
    this.customTrailing,
    this.trailingColor,
    this.trailingSize,
    this.crossAxisAlignment,
    this.showTrailing,
    this.hitText,
    this.hitTextStyle,
    this.showBottomBorder: true,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: this.showBottomBorder ? Border(bottom: BorderSide(color: DefaultStyle.lineColor, width: 0.5)) : null,
      ),
      child: Row(
        crossAxisAlignment: this.crossAxisAlignment ?? CrossAxisAlignment.center,
        children: <Widget>[
          _buildLeft(),
          Expanded(child: _buildContent()),
          _buildRight(),
        ],
      ),
    );

    return this.onClick == null ? current : GestureDetector(onTap: () => this.onClick?.call(), child: current);
  }

  EdgeInsets get _padding =>
      this.padding ??
      EdgeInsets.fromLTRB(
        DefaultStyle.intervalXLarge,
        DefaultStyle.intervalXLarge,
        DefaultStyle.intervalXLarge,
        DefaultStyle.intervalXLarge,
      );

  EdgeInsets get _margin => this.margin ?? EdgeInsets.all(0.0);

  Color get _backgroundColor => this.backgroundColor ?? DefaultStyle.cellBackgroundColor;

  Color get _requiredColor => this.requredColor ?? DefaultStyle.red;

  double get _labelWidth => this.labelWidth ?? DefaultStyle.cellLabelWidth;

  bool get _showTrailing => this.showTrailing == null ? this.onClick != null : this.showTrailing;

  Widget _buildLeft() {
    if (this.customLabel != null) return this.customLabel;

    if (this.label == null) return Container();

    Widget _icon =
        (this.isRequired ?? false) ? Container(child: Text('*', style: TextStyle(color: _requiredColor))) : Container();
    Widget _lable = Text(this.label, style: this.labelStyle ?? TextStyle(fontSize: DefaultStyle.fontSizeNormal));
    Widget _row = Row(children: <Widget>[_icon, _lable]);

    return Container(width: _labelWidth, child: _row);
  }

  Widget _buildContent() {
    if (this.customContent != null) return this.customContent;

    if ((this.content ?? '') == '' && this.hitText != null && this.hitText != '') {
      return Text(this.hitText,
          style: this.hitTextStyle ??
              TextStyle(fontSize: DefaultStyle.fontSizeNormal, color: DefaultStyle.textColorSecondary));
    }

    return Text(this.content ?? '', style: this.contentStyle ?? TextStyle(fontSize: DefaultStyle.fontSizeNormal));
  }

  Widget _buildRight() {
    if (this.customTrailing != null) return this.customTrailing;

    Widget current = _showTrailing
        ? Container(
            alignment: Alignment.center,
            child: Icon(
              Icons.keyboard_arrow_right,
              color: this.trailingColor ?? DefaultStyle.cellTrailingIconColor,
              size: this.trailingSize ?? DefaultStyle.cellTrailingIconSize,
            ),
          )
        : Container();

    return current;
  }
}
