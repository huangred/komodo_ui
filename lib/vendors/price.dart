import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencySymbol {
  static const String CNY = '¥';
  static const String USD = '\$';
  static const String EUR = '€';
  static const String GBP = '£';
}

class Price extends StatelessWidget {
  // 价格
  final dynamic value;
  // 价格颜色
  final Color color;

  final Color symbolColor;

  // 字体大小
  final double size;
  final double symbolSize;
  // 货币符号
  final String currency;
  // 保留的小数尾数，默认不保留0，如果5.80=>5.8, 2.00=>2
  final int decimal;
  // 是否按照千分号形式显示
  final bool thousands;

  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool lineThrough;
  final String label;
  final TextStyle labelStyle;
  final bool shrink;

  const Price({
    Key key,
    this.currency,
    this.size = 14.0,
    this.symbolSize = 14.0,
    @required this.value,
    this.color = Colors.black,
    this.decimal,
    this.thousands = false,
    this.fontWeight = FontWeight.normal,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.lineThrough = false,
    this.label,
    this.labelStyle,
    this.symbolColor,
    this.shrink = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      margin: this.margin,
      child: Row(
        textBaseline: TextBaseline.ideographic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _renderLabel(),
          _renderSymbol(),
          _renderPrice(),
          _renderShrinkDigits(),
        ],
      ),
    );
  }

  Widget _renderLabel() {
    if (this.label == null || this.label.trim() == '') return SizedBox();

    Widget current = Text(this.label);

    if (this.labelStyle != null) current = DefaultTextStyle(style: this.labelStyle, child: current);

    return current;
  }

  Widget _renderSymbol() {
    Widget current = Text(this.currency ?? CurrencySymbol.USD,
        style: TextStyle(
          fontSize: symbolSize,
          color: this.symbolColor ?? color,
        ));

    return current;
  }

  Widget _renderPrice() {
    Widget current = Text(shrink ? getPriceString().split('.')[0] : getPriceString(),
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: this.fontWeight,
          decoration: this.lineThrough ? TextDecoration.lineThrough : null,
          decorationThickness: 2.0,
          decorationStyle: TextDecorationStyle.solid,
        ));

    return current;
  }

  Widget _renderShrinkDigits() {
    if (this.shrink == false) return SizedBox();

    List<String> arr = getPriceString().split('.');

    if (arr.length == 1) return SizedBox();

    return Text('.' + arr[1],
        style: TextStyle(
          fontSize: size * 0.6,
          color: color,
          fontWeight: this.fontWeight,
          decoration: this.lineThrough ? TextDecoration.lineThrough : null,
          decorationThickness: 2.0,
          decorationStyle: TextDecorationStyle.solid,
        ));
  }

  String getPriceString() {
    String pattern = this.thousands == true ? '###,###' : '###';

    if (this.decimal == null)
      pattern = pattern + '.##';
    else if (this.decimal > 0) pattern = pattern + '.' + '0'.padRight(this.decimal, '0');

    var format = NumberFormat(pattern);

    double v = double.tryParse(this.value.toString());

    String ret = format.format(v ?? 0.00);

    return ret;
  }
}
