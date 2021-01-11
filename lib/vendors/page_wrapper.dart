// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../themes/style.dart';
// import '../vendors/common.dart';

// class PageWrapper extends StatefulWidget {
//   final bool autoLeading;

//   final Widget leading;

//   final Function leadingClick;
//   final Color leadingColor;
//   final String title;

//   final TextStyle titleStyle;

//   final bool titleCenter;

//   final Widget titleWidget;

//   final String actionText;
//   final TextStyle actionTextStyle;

//   final IconData actionIconData;
//   final double actionIconSize;
//   final Color actionIconColor;

//   final Function actionClick;

//   final List<Widget> actionWidgets;
//   final Color appBarBackground;

//   final Color pageBackgroundColor;

//   final Widget child;

//   final EdgeInsetsGeometry padding;

//   final hasAppBar;

//   final double leadingSize;
//   final Brightness brightness;
//   final double elevation;
//   final Widget actionWidget;
//   final Widget floatingActionButton;

//   const PageWrapper({
//     Key key,
//     this.autoLeading = true,
//     this.leading,
//     this.leadingColor,
//     this.leadingClick,
//     this.title,
//     this.titleStyle,
//     this.titleCenter = true,
//     this.titleWidget,
//     this.actionText,
//     this.actionTextStyle,
//     this.actionIconData,
//     this.actionIconSize,
//     this.actionIconColor,
//     this.actionClick,
//     this.actionWidgets,
//     this.appBarBackground,
//     this.pageBackgroundColor,
//     this.child,
//     this.padding,
//     this.hasAppBar = true,
//     this.leadingSize,
//     this.brightness,
//     this.elevation,
//     this.actionWidget,
//     this.floatingActionButton,
//   });

//   @override
//   State<StatefulWidget> createState() => _PageWrapperState();
// }

// class _PageWrapperState extends State<PageWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: widget.pageBackgroundColor ?? Style.pageBackground,
//       appBar: _appbar(),
//       body: _body(),
//       floatingActionButton: widget.floatingActionButton,
//     );
//   }

//   Widget _appbar() {
//     if (widget.hasAppBar == false) return null;

//     return CommonWidget.getAppBar(
//         autoLeading: widget.autoLeading,
//         leadingWidget: widget.leading,
//         leadingColor: widget.leadingColor,
//         leadingClick: widget.leadingClick,
//         leadingSize: widget.leadingSize,
//         title: widget.title,
//         titleStyle: widget.titleStyle,
//         titleCenter: widget.titleCenter,
//         titleWidget: widget.titleWidget,
//         actionText: widget.actionText,
//         actionTextStyle: widget.actionTextStyle,
//         actionIconData: widget.actionIconData,
//         actionIconSize: widget.actionIconSize,
//         actionIconColor: widget.actionIconColor,
//         actionClick: widget.actionClick,
//         actionWidget: widget.actionWidget,
//         actionWidgets: widget.actionWidgets,
//         background: widget.appBarBackground,
//         elevation: widget.elevation,
//         brightness: widget.brightness);
//   }

//   Widget _body() {
//     Widget body = Padding(
//       padding: widget.padding ?? EdgeInsets.symmetric(horizontal: Style.intervalNormal),
//       child: widget.child,
//     );

//     return body;
//   }
// }
