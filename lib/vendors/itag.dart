import 'package:flutter/material.dart';
import '../style/default_style.dart';
import '../utils/extensions/string_extension.dart';

enum ITagSize {
  XLarge,
  Large,
  Normal,
  Small,
  XSmall,
}

enum ITagType {
  Default,
  Primary,
  Info,
  Danger,
  Warning,
  Success,
  Random,
}

class ITag extends StatelessWidget {
  ///标题
  final String title;

  ///标题颜色
  final Color titleColor;

  ///标题字体大小
  final double fontSize;

  ///背景色
  final Color backgroundColor;

  ///边框颜色
  final Color borderColor;

  ///圆角度数
  final double radius;

  ///内边距
  final EdgeInsetsGeometry padding;

  ///外边距
  final EdgeInsetsGeometry margin;

  ///自定义内容
  final Widget child;

  ///宽度
  final double width;

  ///高度
  final double height;

  ///点击事件
  final Function onClick;

  ///tag大小
  final ITagSize size;

  ///tag主题类型
  final ITagType type;

  //是否填充背景色
  final bool filled;

  final bool showBorder;

  ITag({
    this.title,
    this.backgroundColor,
    this.borderColor,
    this.titleColor,
    this.radius,
    this.fontSize,
    this.padding,
    this.margin,
    this.child,
    this.height,
    this.width,
    this.onClick,
    this.size,
    this.type,
    this.filled,
    this.showBorder,
  });
  bool get _filled => this.filled ?? true;
  bool get _showBorder => this.showBorder ?? false;

  Color get _backgroundColor {
    if (_filled == false) return Colors.transparent;

    if (this.backgroundColor != null) return this.backgroundColor;

    switch (this.type) {
      case ITagType.Default:
        return DefaultStyle.gray3;
      case ITagType.Random:
        return this.title.toColor;
      case ITagType.Primary:
        return DefaultStyle.primary;
      case ITagType.Info:
        return DefaultStyle.info;
      case ITagType.Warning:
        return DefaultStyle.warning;
      case ITagType.Danger:
        return DefaultStyle.danger;
      case ITagType.Success:
        return DefaultStyle.success;
      default:
        return DefaultStyle.gray3;
    }
  }

  Color get _borderColor {
    if (this.borderColor != null) return this.borderColor;

    switch (this.type) {
      case ITagType.Default:
        return DefaultStyle.gray3;
      case ITagType.Random:
        return this.title.toColor;
      case ITagType.Primary:
        return DefaultStyle.primary;
      case ITagType.Info:
        return DefaultStyle.info;
      case ITagType.Warning:
        return DefaultStyle.warning;
      case ITagType.Danger:
        return DefaultStyle.danger;
      case ITagType.Success:
        return DefaultStyle.success;
      default:
        return DefaultStyle.gray3;
    }
  }

  Color get _titleColor {
    if (this.titleColor != null) return this.titleColor;
    if (_filled) return DefaultStyle.white;

    switch (this.type) {
      case ITagType.Default:
        return DefaultStyle.gray3;
      case ITagType.Random:
        return this.title.toColor;
      case ITagType.Primary:
        return DefaultStyle.primary;
      case ITagType.Info:
        return DefaultStyle.info;
      case ITagType.Warning:
        return DefaultStyle.warning;
      case ITagType.Danger:
        return DefaultStyle.danger;
      case ITagType.Success:
        return DefaultStyle.success;
      default:
        return DefaultStyle.gray3;
    }
  }

  double get _fontSize => this.fontSize ?? _sizes[_size]['fontSize'];

  EdgeInsets get _padding => this.padding ?? _sizes[_size]['padding'];
  EdgeInsets get _margin => this.margin ?? EdgeInsets.all(0.0);

  double get _radius => this.radius ?? _sizes[_size]['radius'];

  Widget get _child => this.child ?? Text(this.title, textAlign: TextAlign.center, style: TextStyle(color: _titleColor, fontSize: _fontSize));
  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      height: this.height,
      margin: _margin,
      padding: _padding,
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: Border.all(color: _showBorder ? _borderColor : Colors.transparent, width: _showBorder ? 1.0 : 0.0),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Center(child: _child),
    );

    current = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [current],
    );

    return this.onClick == null ? current : GestureDetector(onTap: () => this.onClick(), child: current);
  }

  String get _size {
    switch (this.size) {
      case ITagSize.XLarge:
        return "xlarge";
      case ITagSize.Large:
        return "large";
      case ITagSize.Normal:
        return "normal";
      case ITagSize.Small:
        return "small";
      case ITagSize.XSmall:
        return "xsmall";
      default:
        return "normal";
    }
  }

  final Map<String, dynamic> _sizes = {
    "xlarge": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeXLarge,
      "padding": EdgeInsets.fromLTRB(
        DefaultStyle.intervalNormal,
        DefaultStyle.intervalSmall,
        DefaultStyle.intervalNormal,
        DefaultStyle.intervalSmall,
      ),
      "radius": DefaultStyle.radiusXLarge,
    },
    "large": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeLarge,
      "padding": EdgeInsets.fromLTRB(
        DefaultStyle.intervalLarge,
        DefaultStyle.intervalSmall,
        DefaultStyle.intervalLarge,
        DefaultStyle.intervalSmall,
      ),
      "radius": DefaultStyle.radiusLarge,
    },
    "normal": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeNormal,
      "padding": EdgeInsets.symmetric(horizontal: DefaultStyle.intervalNormal, vertical: DefaultStyle.intervalSmall),
      "radius": DefaultStyle.radiusNormal,
    },
    "small": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeSmall,
      "padding": EdgeInsets.fromLTRB(DefaultStyle.intervalSmall, 0, DefaultStyle.intervalSmall, 0),
      "radius": DefaultStyle.radiusSmall,
    },
    "xsmall": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeXSmall,
      "padding": EdgeInsets.fromLTRB(DefaultStyle.intervalSmall, 0, DefaultStyle.intervalSmall, 0),
      "radius": DefaultStyle.radiusXSmall,
    },
  };
}
