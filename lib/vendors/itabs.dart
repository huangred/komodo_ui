// import 'package:flutter/material.dart';
// import '../themes/style.dart';

// class TabItem {
//   String title;
//   Widget titelWidget;
//   String subTitle;
//   Widget subTitleWidget;
//   bool selected;
//   Function action;

//   TabItem({this.title, this.selected, this.action, this.titelWidget, this.subTitle, this.subTitleWidget});
// }

// class ITabs extends StatelessWidget {
//   final List<TabItem> items;
//   final bool center;
//   final TextStyle activeTitleStyle;
//   final TextStyle activeSubTitleStyle;
//   final TextStyle inActiveTitleStyle;
//   final TextStyle inActiveSubTitleStyle;
//   final Color indicatorColor;
//   final double indicatorWidth;
//   final double indicatorHeight;
//   final bool showIndicator;
//   final double itemSpace;
//   final double indicatorSpace;
//   final EdgeInsetsGeometry padding;
//   final EdgeInsetsGeometry margin;
//   final Color background;

//   const ITabs({
//     @required this.items,
//     this.center = false,
//     this.activeTitleStyle,
//     this.activeSubTitleStyle,
//     this.inActiveTitleStyle,
//     this.inActiveSubTitleStyle,
//     this.indicatorColor,
//     this.indicatorHeight,
//     this.indicatorWidth,
//     this.showIndicator = true,
//     this.itemSpace,
//     this.indicatorSpace,
//     this.padding,
//     this.margin,
//     this.background,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _items = this.items.map(_renderItem).toList();

//     List<Widget> children = List<Widget>();

//     int length = _items.length;
//     for (int i = 0; i < length; i++) {
//       children.add(_items[i]);
//       if (this.center == false && i < length - 1) children.add(SizedBox(width: this.itemSpace ?? Style.iTabsItemSpace));
//     }

//     return Container(
//       color: this.background ?? Style.iTabsBackground,
//       padding: this.padding ?? Style.iTabsPadding,
//       margin: this.margin ?? Style.iTabsMargin,
//       child: Row(
//         mainAxisAlignment: this.center ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
//         children: children,
//       ),
//     );
//   }

//   Widget _renderItem(TabItem tab) {
//     Widget title = tab.titelWidget ??
//         Text(
//           tab.title,
//           style: (tab.selected ?? false)
//               ? (this.activeTitleStyle ?? Style.iTabsActiveTitleStyle)
//               : (this.inActiveTitleStyle ?? Style.iTabsInActiveTitleStyle),
//         );

//     Widget indicator = _getIndicator(tab.selected ?? false);

//     Widget child = Container(
//       child: Column(
//         children: <Widget>[
//           title,
//           this.showIndicator == true ? SizedBox(height: _indicatorSpace) : Container(),
//           this.showIndicator == true ? indicator : Container(),
//         ],
//       ),
//     );

//     if (tab.subTitleWidget != null || tab.subTitle != null) {
//       Widget subTitle = tab.subTitleWidget ??
//           Container(
//             margin: EdgeInsets.only(bottom: _indicatorHeight + _indicatorSpace),
//             child: Text(
//               tab.subTitle,
//               style: (tab.selected ?? false)
//                   ? (this.activeSubTitleStyle ?? Style.iTabsActiveSubTitleStyle)
//                   : (this.inActiveSubTitleStyle ?? Style.iTabsinActiveSubTitleStyle),
//             ),
//           );

//       child = Row(children: <Widget>[child, SizedBox(width: Style.intervalBase), subTitle]);
//     }

//     return GestureDetector(
//       onTap: () => tab.action?.call(),
//       child: child,
//     );
//   }

//   Widget _getIndicator(bool selected) {
//     return Container(
//       height: _indicatorHeight,
//       width: this.indicatorWidth ?? Style.iTabsIndicatorWidth,
//       decoration: BoxDecoration(
//         color: this.showIndicator && selected ? (this.indicatorColor ?? Style.iTabsIndicatorColor) : Colors.transparent,
//         borderRadius: BorderRadius.circular(Style.radiusMax),
//       ),
//     );
//   }

//   double get _indicatorHeight => this.indicatorHeight ?? Style.iTabsIndicatorHeight;
//   double get _indicatorSpace => this.indicatorSpace ?? Style.iTabsIndicatorSpace;
// }
