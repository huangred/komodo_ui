// import 'package:flutter/material.dart';
// import '../themes/style.dart';

// class IconText extends StatelessWidget {
//   final Widget icon;
//   final IconData iconData;
//   final double iconSize;
//   final Color iconColor;
//   final String title;
//   final TextStyle titleStyle;
//   final Widget titleWidget;
//   final double height;
//   final double space;
//   IconText({
//     Key key,
//     this.icon,
//     this.iconData,
//     this.iconSize,
//     this.iconColor,
//     this.title,
//     this.titleStyle,
//     this.titleWidget,
//     this.height = 25,
//     this.space,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget current = Row(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         _icon(),
//         SizedBox(width: this.space ?? Style.intervalBase),
//         _title(),
//       ],
//     );

//     return current;
//   }

//   Widget _icon() {
//     Widget current = this.icon ??
//         Icon(
//           this.iconData,
//           size: this.iconSize ?? Style.iconTextIconSize,
//           color: this.iconColor ?? Style.iconTextIconColor,
//         ) ??
//         null;

//     if (current == null) return Container();

//     current = Container(
//       height: this.height,
//       alignment: Alignment.center,
//       child: current,
//     );

//     return current;
//   }

//   Widget _title() {
//     Widget current = this.titleWidget;
//     if (current == null && this.title == null) return Container();

//     current = Text(this.title, style: this.titleStyle ?? Style.iconTextTitleStyle);

//     current = Container(
//       height: this.height,
//       alignment: Alignment.center,
//       child: current,
//     );

//     return current;
//   }
// }
