import 'package:flutter/material.dart';
import '../style/default_style.dart';
import 'spinkits/circle.dart';

enum IButtonSize {
  XLarge,
  Large,
  Normal,
  Small,
  XSmall,
}

enum IButtonType {
  Default,
  Primary,
  Info,
  Danger,
  Warning,
  Success,
}

class IButton extends StatelessWidget {
  IButton({
    Key key,
    @required this.caption,
    this.backgroundColor,
    this.onClick,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.radius,
    this.captionColor,
    this.width,
    this.height,
    this.fontSize,
    this.size = IButtonSize.Normal,
    this.alignment,
    this.disabled = false,
    this.disabledBackgroundColor,
    this.disabledCaptionColor,
    this.boxShadow,
    this.circle = false,
    this.type = IButtonType.Default,
    this.prefix,
    this.suffix,
    this.loading = false,
    this.loadText,
  }) : super(key: key);

  ///按钮类型
  final IButtonType type;

  ///背景色
  final Color backgroundColor;

  ///标题文字颜色
  final Color captionColor;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  ///标题文字
  final String caption;

  ///圆角度数
  final double radius;

  ///点击事件
  final VoidCallback onClick;

  ///自定义按钮宽度
  final double width;

  ///自定义按钮高度
  final double height;

  ///自定义标题文字大小
  final double fontSize;

  ///按钮大小
  final IButtonSize size;

  ///位置
  final Alignment alignment;

  ///禁用时背景颜色
  final Color disabledBackgroundColor;

  ///是否禁用
  final bool disabled;

  ///禁用是文本颜色
  final Color disabledCaptionColor;

  ///边框阴影
  final List<BoxShadow> boxShadow;

  ///圆形
  final bool circle;

  ///前置widget
  final Widget prefix;

  ///后置widget
  final Widget suffix;

  ///显示加载中
  final bool loading;

  ///加载时文本
  final String loadText;

  final Map<String, dynamic> _sizes = {
    "xlarge": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeXLarge,
      "width": DefaultStyle.buttonSizeWidthXLarge,
      "height": DefaultStyle.buttonSizeHeightXLarge
    },
    "large": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeLarge,
      "width": DefaultStyle.buttonSizeWidthLarge,
      "height": DefaultStyle.buttonSizeHeightLarge
    },
    "normal": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeNormal,
      "width": DefaultStyle.buttonSizeWidthNormal,
      "height": DefaultStyle.buttonSizeHeightNormal
    },
    "small": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeSmall,
      "width": DefaultStyle.buttonSizeWidthSmall,
      "height": DefaultStyle.buttonSizeHeightSmall
    },
    "xsmall": <String, dynamic>{
      "fontSize": DefaultStyle.fontSizeXSmall,
      "width": DefaultStyle.buttonSizeWidthXSmall,
      "height": DefaultStyle.buttonSizeHeightXSmall
    },
  };

  final Map<String, dynamic> _colors = {
    "default": <String, Color>{
      "backgroundColor": DefaultStyle.buttonBackground,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.buttonCaptionColor,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
    "primary": <String, Color>{
      "backgroundColor": DefaultStyle.primary,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.white,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
    "success": <String, Color>{
      "backgroundColor": DefaultStyle.green,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.white,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
    "info": <String, Color>{
      "backgroundColor": DefaultStyle.gray6,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.black,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
    "danger": <String, Color>{
      "backgroundColor": DefaultStyle.danger,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.white,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
    "warning": <String, Color>{
      "backgroundColor": DefaultStyle.warning,
      "disabledBackgroundColor": DefaultStyle.buttonDisabledBackground,
      "captionColor": DefaultStyle.white,
      "disabledCaptionColor": DefaultStyle.buttonDisabledCaptionColor,
    },
  };

  double get _fontSize => this.fontSize ?? _sizes[_size]['fontSize'];
  double get _radius => this.radius ?? DefaultStyle.radiusSmall;
  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      alignment: Alignment.center,
      width: this.width ?? _sizes[_size]['width'],
      height: this.height ?? _sizes[_size]['height'],
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        shape: this.circle == false ? BoxShape.rectangle : BoxShape.circle,
        color: this.disabled == false
            ? this.backgroundColor ?? _colors[_type]['backgroundColor']
            : this.disabledBackgroundColor ?? _colors[_type]['disabledBackgroundColor'],
        borderRadius: this.circle == false ? BorderRadius.circular(_radius) : null,
        boxShadow: this.boxShadow,
      ),
      child: child,
    );

    current = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [current],
    );

    return this.disabled || this.loading ? current : GestureDetector(onTap: () => onClick?.call(), child: current);
  }

  Widget get child {
    List<Widget> children = List<Widget>();

    if (this.prefix != null) children.add(this.prefix);

    if (this.loading) children.add(_loading);

    if (this.loading && this.loadText != null) children.add(SizedBox(width: DefaultStyle.intervalSmall));

    children.add(_caption);

    if (this.suffix != null) children.add(this.suffix);

    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }

  Widget get _caption => Text(
        this.loading ? this.loadText ?? '' : caption,
        style: TextStyle(
          color: this.disabled == false
              ? this.captionColor ?? _colors[_type]['captionColor']
              : this.disabledCaptionColor ?? _colors[_type]['disabledCaptionColor'],
          fontSize: _fontSize,
        ),
      );

  Widget get _loading => Container(child: SpinKitCircle(color: Colors.white, size: 18), width: 20, height: 20);

  String get _size {
    switch (this.size) {
      case IButtonSize.XLarge:
        return "xlarge";
      case IButtonSize.Large:
        return "large";
      case IButtonSize.Normal:
        return "normal";
      case IButtonSize.Small:
        return "small";
      case IButtonSize.XSmall:
        return "xsmall";
      default:
        return "normal";
    }
  }

  String get _type {
    switch (this.type) {
      case IButtonType.Default:
        return "default";
      case IButtonType.Primary:
        return "primary";
      case IButtonType.Info:
        return "info";
      case IButtonType.Danger:
        return "danger";
      case IButtonType.Warning:
        return "warning";
      case IButtonType.Success:
        return "success";
      default:
        return "default";
    }
  }
}
