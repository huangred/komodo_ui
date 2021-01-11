// import 'package:flutter/material.dart';
// import '../themes/style.dart';
// import 'utils/utils.dart';

// enum ITagSize {
//   XLarge,
//   Large,
//   Normal,
//   Small,
//   XSmall,
// }

// enum ITagType {
//   Default,
//   Primary,
//   Info,
//   Danger,
//   Warning,
//   Success,
//   Random,
// }

// class ITag extends StatelessWidget {
//   ///标题
//   final String caption;

//   ///标题颜色
//   final Color captionColor;

//   ///标题字体大小
//   final double fontSize;

//   ///背景色
//   final Color backgroundColor;

//   ///边框颜色
//   final Color borderColor;

//   ///圆角度数
//   final double radius;

//   ///内边距
//   final EdgeInsetsGeometry padding;

//   ///外边距
//   final EdgeInsetsGeometry margin;

//   ///自定义内容
//   final Widget child;

//   ///宽度
//   final double width;

//   ///高度
//   final double height;

//   ///点击事件
//   final Function onClick;

//   ///tag大小
//   final ITagSize size;

//   ///tag主题类型
//   final ITagType type;

//   //是否填充背景色
//   final bool filled;

//   final bool showBorder;

//   ITag({
//     this.caption,
//     this.backgroundColor,
//     this.borderColor,
//     this.captionColor,
//     this.radius,
//     this.fontSize,
//     this.padding,
//     this.margin,
//     this.child,
//     this.height,
//     this.width,
//     this.onClick,
//     this.size,
//     this.type,
//     this.filled,
//     this.showBorder,
//   });
//   bool get _filled => this.filled ?? true;
//   bool get _showBorder => this.showBorder ?? false;

//   Color get _backgroundColor {
//     if (_filled == false) return Colors.transparent;

//     if (this.backgroundColor != null) return this.backgroundColor;

//     switch (this.type) {
//       case ITagType.Default:
//         return Style.gray3;
//       case ITagType.Random:
//         return Utils.nameToColor(this.caption);
//       case ITagType.Primary:
//         return Style.primary;
//       case ITagType.Info:
//         return Style.info;
//       case ITagType.Warning:
//         return Style.warning;
//       case ITagType.Danger:
//         return Style.danger;
//       case ITagType.Success:
//         return Style.success;
//       default:
//         return Style.gray3;
//     }
//   }

//   Color get _borderColor {
//     if (this.borderColor != null) return this.borderColor;

//     switch (this.type) {
//       case ITagType.Default:
//         return Style.gray3;
//       case ITagType.Random:
//         return Utils.nameToColor(this.caption);
//       case ITagType.Primary:
//         return Style.primary;
//       case ITagType.Info:
//         return Style.info;
//       case ITagType.Warning:
//         return Style.warning;
//       case ITagType.Danger:
//         return Style.danger;
//       case ITagType.Success:
//         return Style.success;
//       default:
//         return Style.gray3;
//     }
//   }

//   Color get _captionColor {
//     if (this.captionColor != null) return this.captionColor;
//     if (_filled) return Style.white;

//     switch (this.type) {
//       case ITagType.Default:
//         return Style.gray3;
//       case ITagType.Random:
//         return Utils.nameToColor(this.caption);
//       case ITagType.Primary:
//         return Style.primary;
//       case ITagType.Info:
//         return Style.info;
//       case ITagType.Warning:
//         return Style.warning;
//       case ITagType.Danger:
//         return Style.danger;
//       case ITagType.Success:
//         return Style.success;
//       default:
//         return Style.gray3;
//     }
//   }

//   double get _fontSize => this.fontSize ?? _sizes[_size]['fontSize'];

//   EdgeInsets get _padding => this.padding ?? _sizes[_size]['padding'];
//   EdgeInsets get _margin => this.margin ?? EdgeInsets.all(0.0);

//   double get _radius => this.radius ?? _sizes[_size]['radius'];

//   Widget get _child => this.child ?? Text(this.caption, textAlign: TextAlign.center, style: TextStyle(color: _captionColor, fontSize: _fontSize));
//   @override
//   Widget build(BuildContext context) {
//     Widget current = Container(
//       height: this.height,
//       margin: _margin,
//       padding: _padding,
//       decoration: BoxDecoration(
//         color: _backgroundColor,
//         border: Border.all(color: _showBorder ? _borderColor : Colors.transparent, width: _showBorder ? 1.0 : 0.0),
//         borderRadius: BorderRadius.circular(_radius),
//       ),
//       child: Center(child: _child),
//     );

//     current = Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [current],
//     );

//     return this.onClick == null ? current : GestureDetector(onTap: () => this.onClick(), child: current);
//   }

//   String get _size {
//     switch (this.size) {
//       case ITagSize.XLarge:
//         return "xlarge";
//       case ITagSize.Large:
//         return "large";
//       case ITagSize.Normal:
//         return "normal";
//       case ITagSize.Small:
//         return "small";
//       case ITagSize.XSmall:
//         return "xsmall";
//       default:
//         return "normal";
//     }
//   }

//   final Map<String, dynamic> _sizes = {
//     "xlarge": <String, dynamic>{
//       "fontSize": Style.fontSizeXLarge,
//       "padding": EdgeInsets.fromLTRB(
//         Style.intervalNormal,
//         Style.intervalSmall,
//         Style.intervalNormal,
//         Style.intervalSmall,
//       ),
//       "radius": Style.radiusXLarge,
//     },
//     "large": <String, dynamic>{
//       "fontSize": Style.fontSizeLarge,
//       "padding": EdgeInsets.fromLTRB(
//         Style.intervalLarge,
//         Style.intervalSmall,
//         Style.intervalLarge,
//         Style.intervalSmall,
//       ),
//       "radius": Style.radiusLarge,
//     },
//     "normal": <String, dynamic>{
//       "fontSize": Style.fontSizeNormal,
//       "padding": EdgeInsets.symmetric(horizontal: Style.intervalNormal, vertical: Style.intervalSmall),
//       "radius": Style.radiusNormal,
//     },
//     "small": <String, dynamic>{
//       "fontSize": Style.fontSizeSmall,
//       "padding": EdgeInsets.fromLTRB(Style.intervalSmall, 0, Style.intervalSmall, 0),
//       "radius": Style.radiusSmall,
//     },
//     "xsmall": <String, dynamic>{
//       "fontSize": Style.fontSizeXSmall,
//       "padding": EdgeInsets.fromLTRB(Style.intervalSmall, 0, Style.intervalSmall, 0),
//       "radius": Style.radiusXSmall,
//     },
//   };
// }
