// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:sejiao_rebuild/vendors/utils/screen_util.dart';
// import 'utils/navigation.dart';
// import '../themes/style.dart';

// class CommonWidget {
//   static AppBar getAppBar({
//     ///是否显示后退图标
//     final bool autoLeading,

//     ///自定义后退组件
//     final Widget leadingWidget,

//     ///后退图标颜色
//     final Color leadingColor,

//     ///后退图标大小
//     final double leadingSize,

//     ///后退图标的点击事件
//     final Function leadingClick,

//     ///标题
//     final String title,

//     ///标题样式
//     final TextStyle titleStyle,

//     ///标题是否居中
//     final bool titleCenter,

//     ///自定义标题组件
//     final Widget titleWidget,

//     ///appbar尾部操作文本
//     final String actionText,

//     ///appbar尾部文本样式
//     final TextStyle actionTextStyle,

//     ///appbar尾部操作图标
//     final IconData actionIconData,

//     ///appbar尾部操作图标大小
//     final double actionIconSize,

//     ///appbar尾部操作图标颜色
//     final Color actionIconColor,

//     ///appbar尾部操作响应事件
//     final Function actionClick,

//     ///appbar尾部自定义组件
//     final Widget actionWidget,

//     ///appbar尾部自定义组件列表
//     final List<Widget> actionWidgets,

//     ///appbar背景色
//     final Color background,

//     ///状态栏图标颜色
//     final Brightness brightness,

//     ///appbar底部阴影
//     final double elevation,
//   }) {
//     Widget leading = autoLeading == true
//         ? getAppbarLeading(
//             leadingWidget: leadingWidget,
//             leadingColor: leadingColor,
//             leadingSize: leadingSize,
//             leadingClick: leadingClick,
//           )
//         : null;

//     Widget middle = titleWidget;
//     if (middle == null && title != null) {
//       middle = Text(title, overflow: TextOverflow.ellipsis, style: titleStyle ?? Style.appBarTitleTextStyle);
//     }

//     List<Widget> actions = List<Widget>();
//     Widget action = actionWidget;

//     if (action == null) {
//       if (actionIconData != null) {
//         action = Icon(
//           actionIconData,
//           color: actionIconColor ?? Style.appBarActionIconColor,
//           size: actionIconSize ?? Style.appBarActionIconSize,
//         );
//       }

//       if (actionText != null) {
//         action = Text(actionText, style: actionTextStyle ?? Style.appBarActionTextStyle);
//       }
//     }

//     if (action != null) {
//       action = Container(
//         padding: EdgeInsets.only(left: Style.appBarSpace, right: Style.appBarSpace),
//         alignment: Alignment.center,
//         child: action,
//       );
//     }
//     if (actionClick != null) {
//       action = GestureDetector(onTap: () => actionClick(), child: action);
//     }
//     if (action != null) actions.add(action);

//     if (actionWidgets != null && actionWidgets.length > 0) {
//       int len = actionWidgets.length;
//       for (int i = 0; i < len; i++) {
//         actions.add(actionWidgets[i]);
//         if (i < len - 1) actions.add(SizedBox(width: Style.appBarSpace));
//       }
//       actions.add(SizedBox(width: Style.appBarSpace));
//     }

//     middle = Container(
//       padding: EdgeInsets.only(
//         left: titleCenter == false && autoLeading == false ? Style.appBarSpace : 0.0,
//       ),
//       child: middle,
//     );

//     return AppBar(
//       brightness: brightness ?? Brightness.dark,
//       backgroundColor: background ?? Style.appBarBackground,
//       elevation: elevation ?? 0.5,
//       titleSpacing: 0,
//       automaticallyImplyLeading: autoLeading ?? true,
//       leading: autoLeading == true ? leading : null,
//       centerTitle: titleCenter ?? true,
//       title: middle,
//       actions: actions,
//     );
//   }

//   static Widget getAppbarLeading({Widget leadingWidget, Color leadingColor, double leadingSize, Function leadingClick}) {
//     Widget current = leadingWidget ??
//         Icon(
//           Icons.arrow_back_ios,
//           color: leadingColor ?? Style.appBarLeadingCorlor,
//           size: leadingSize ?? Style.appBarLeadingSize,
//         );

//     current = Container(
//       padding: EdgeInsets.only(left: Style.appBarSpace, right: Style.appBarSpace),
//       child: current,
//     );

//     current = GestureDetector(
//       child: current,
//       onTap: () => leadingClick == null ? Navigation.pop() : leadingClick(),
//     );

//     return current;
//   }

//   static Future showBottomModelPanel({
//     @required Widget child,
//     double height = 200.0,
//     double radius,
//     Color backgroundColor = Colors.white,
//   }) {
//     return showModalBottomSheet(
//       context: Navigation.context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (context) {
//         return Container(
//           height: height,
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(radius ?? Style.radiusNormal)),
//           ),
//           child: child,
//         );
//       },
//     );
//   }

//   static Widget noData({bool visible = false, String message, double top}) {
//     if (visible == false) return Container();

//     Widget current = Container(
//       height: top == null ? ScreenUtil.height - kToolbarHeight - MediaQueryData.fromWindow(window).padding.top : null,
//       alignment: Alignment.center,
//       margin: EdgeInsets.only(top: top ?? 0),
//       child: Text(message ?? '暂无数据'),
//     );

//     return current;
//   }
// }
