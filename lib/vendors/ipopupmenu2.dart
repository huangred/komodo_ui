import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

class MenuItem {
  MenuItem({this.iconData, this.icon, this.title, this.titleWidget, this.click, this.child});

  IconData iconData;
  Icon icon;

  String title;
  Text titleWidget;

  Function click;

  Widget child;
}

class IPopupMenu extends StatefulWidget {
  final List<MenuItem> meunItems;

  final Widget child;
  final double arrowHeight;
  final double arrowWidth;
  final double radius;
  final Offset menuOffset;
  final Offset arrowOffset;
  final EdgeInsetsGeometry itemPadding;
  final Color maskColor;
  final Color backgroundColor;
  final Color dividerColor;
  final bool longPress;
  final HitTestBehavior behavior;
  final double minMargin;
  final bool disabled;

  IPopupMenu({
    @required this.child,
    @required this.meunItems,
    this.arrowWidth = 16.0,
    this.arrowHeight = 8.0,
    this.radius = 3,
    this.menuOffset = const Offset(0.0, 0.0),
    this.arrowOffset = const Offset(0.0, 0.0),
    this.itemPadding,
    this.maskColor,
    this.backgroundColor,
    this.dividerColor,
    this.longPress = false,
    this.behavior,
    this.minMargin = 8.0,
    this.disabled = false,
  });
  @override
  _IPopupMenuState createState() => _IPopupMenuState();
}

class _IPopupMenuState extends State<IPopupMenu> with WidgetsBindingObserver {
  RenderObject renderObject;
  OverlayEntry entry;

  double width;
  double height;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    removeOverlay(); //键盘关闭的时候隐藏弹出的菜单
    super.didChangeMetrics();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((call) {
      if (!mounted) return;
      renderObject = context.findRenderObject();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (entry != null) {
          removeOverlay();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: GestureDetector(
        behavior: widget.behavior,
        child: widget.child,
        onLongPress: widget.longPress && !widget.disabled ? onTap : null,
        onTap: widget.longPress || widget.disabled ? null : onTap,
      ),
    );
  }

  void onTap() {
    Widget menuWidget = _RenderPopupMenu(
      meunItems: widget.meunItems,
      child: widget.child,
      arrowHeight: widget.arrowHeight,
      arrowWidth: widget.arrowWidth,
      radius: widget.radius,
      menuOffset: widget.menuOffset,
      arrowOffset: widget.arrowOffset,
      itemPadding: widget.itemPadding,
      renderObject: renderObject,
      maskColor: widget.maskColor,
      backgroundColor: widget.backgroundColor,
      dividerColor: widget.dividerColor,
      onRemove: () => removeOverlay(),
      minMargin: widget.minMargin,
    );

    entry = OverlayEntry(builder: (context) => menuWidget);

    Overlay.of(context).insert(entry);
    setState(() {});
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }
}

class _RenderPopupMenu extends StatefulWidget {
  final List<MenuItem> meunItems;
  final Widget child;
  final double arrowHeight;
  final double arrowWidth;
  final double radius;
  final Offset menuOffset;
  final Offset arrowOffset;
  final EdgeInsetsGeometry itemPadding;
  final Color maskColor;
  final Color backgroundColor;
  final Color dividerColor;
  final Function onRemove;
  final RenderObject renderObject;
  final double minMargin;
  _RenderPopupMenu({
    @required this.child,
    @required this.meunItems,
    this.arrowWidth,
    this.arrowHeight,
    this.radius,
    this.menuOffset,
    this.arrowOffset,
    this.itemPadding,
    this.maskColor,
    this.backgroundColor,
    this.dividerColor,
    this.onRemove,
    this.renderObject,
    this.minMargin,
  });
  @override
  _RenderPopupMenuState createState() => _RenderPopupMenuState();
}

class _RenderPopupMenuState extends State<_RenderPopupMenu> {
  Size size;
  Offset position;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    size = widget.renderObject.paintBounds.size;
    dynamic vector3 = widget.renderObject.getTransformTo(null)?.getTranslation();
    position = Offset(vector3[0], vector3[1]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _showMenu();
  }

  Widget _showMenu() {
    bool isTop = position.dy < (MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom) * 0.5;

    Widget current = CustomMultiChildLayout(
      delegate: _MenuLayout(position: position, targetSize: size, minMargin: widget.minMargin, menuOffset: widget.menuOffset, arrowOffset: widget.arrowOffset),
      children: <Widget>[
        LayoutId(
          id: _MenuChildIds.item,
          child: MenuPanel(
            meunItems: widget.meunItems,
            dividerColor: widget.dividerColor,
            itemPadding: widget.itemPadding,
            onRemove: widget.onRemove,
            radius: widget.radius,
            backgroundColor: widget.backgroundColor,
          ),
        ),
        LayoutId(
          id: _MenuChildIds.arrow,
          child: CustomPaint(
            size: Size(widget.arrowWidth, widget.arrowHeight),
            painter: TrianglePainter(color: widget.backgroundColor ?? Color(0xFF323232), isInverted: isTop),
          ),
        ),
      ],
    );

    current = MediaQuery.removePadding(context: context, removeTop: true, removeBottom: true, removeLeft: true, removeRight: true, child: current);

    current = Material(color: widget.maskColor ?? Colors.transparent, child: current);

    current = GestureDetector(onTap: () => widget.onRemove(), child: current);

    return current;
  }
}

enum _MenuChildIds { item, arrow }

class _MenuLayout extends MultiChildLayoutDelegate {
  final Offset position;
  final Offset menuOffset;
  final Offset arrowOffset;
  final Size targetSize;
  final double minMargin;

  _MenuLayout({this.position, this.targetSize, this.minMargin, this.arrowOffset, this.menuOffset});

  @override
  void performLayout(Size size) {
    Size menuSize = layoutChild(_MenuChildIds.item, BoxConstraints(maxWidth: size.width));
    Size arrowSize = layoutChild(_MenuChildIds.arrow, BoxConstraints(maxWidth: size.width));

    double screenH = MediaQueryData.fromWindow(ui.window).size.height - MediaQueryData.fromWindow(ui.window).viewInsets.bottom;
    double screenW = MediaQueryData.fromWindow(ui.window).size.width;
    bool isTop = position.dy < screenH * 0.5;

    Offset itemsOffset = Offset(
      position.dx + (targetSize.width - menuSize.width) * 0.5,
      isTop ? position.dy + targetSize.height + arrowSize.height : position.dy - menuSize.height - arrowSize.height,
    );
    itemsOffset = itemsOffset + menuOffset;

    Offset triangleOffset = Offset(
      position.dx + (targetSize.width - arrowSize.width) * 0.5,
      isTop ? position.dy + targetSize.height : position.dy - arrowSize.height,
    );
    triangleOffset = triangleOffset + arrowOffset;

    //如果菜单显示超出屏幕则修正
    if (itemsOffset.dx <= 0) itemsOffset = Offset(this.minMargin, itemsOffset.dy);
    if (itemsOffset.dx + menuSize.width >= screenW) itemsOffset = Offset(screenW - menuSize.width - this.minMargin, itemsOffset.dy);

    if (itemsOffset.dy + menuSize.height > screenH) //被点击的元素高度太大，需特殊处理
    {
      itemsOffset = Offset(itemsOffset.dx, screenH - menuSize.height);
      triangleOffset = Offset(triangleOffset.dx, screenH - menuSize.height - arrowSize.height);
    }

    positionChild(_MenuChildIds.item, itemsOffset);

    positionChild(_MenuChildIds.arrow, triangleOffset);
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}

class MenuPanel extends StatelessWidget {
  final List<MenuItem> meunItems;
  final EdgeInsetsGeometry itemPadding;
  final Color dividerColor;
  final Function onRemove;
  final double radius;
  final Color backgroundColor;

  MenuPanel({Key key, this.meunItems, this.itemPadding, this.dividerColor, this.onRemove, this.radius, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(this.radius)), color: this.backgroundColor ?? Color(0xFF323232)),
      child: _renderMenuPanel(),
    );

    return current;
  }

  Widget _renderMenuPanel() {
    List<Widget> children = this.meunItems.map(_buildItem).toList();

    Widget current = Column(mainAxisSize: MainAxisSize.min, children: children);

    current = Row(mainAxisSize: MainAxisSize.min, children: [current]);

    return current;
  }

  Widget _buildItem(MenuItem item) {
    if (item.child != null) return item.child;

    int index = this.meunItems.indexOf(item);

    Widget icon = item.icon ?? (item.iconData == null ? Icon(Icons.menu, color: Colors.transparent) : Icon(item.iconData, color: Colors.white));

    Widget title = item.titleWidget ?? Text(item.title, style: TextStyle(color: Colors.white));

    Widget current = Row(children: [icon, SizedBox(width: 5), title]);

    current = Container(
      padding: this.itemPadding ?? EdgeInsets.fromLTRB(10, 8, 14, 8),
      decoration: index == meunItems.length - 1 ? BoxDecoration() : BoxDecoration(border: Border(bottom: BorderSide(color: this.dividerColor ?? Colors.white12, width: 0.5))),
      child: current,
    );

    current = GestureDetector(
      onTap: () {
        this.onRemove();
        item.click?.call();
      },
      child: current,
    );

    return current;
  }
}

class TrianglePainter extends CustomPainter {
  Paint _paint;
  final Color color;

  final bool isInverted;

  TrianglePainter({@required this.color, this.isInverted = false}) {
    _paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..strokeWidth = 10;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    if (this.isInverted) {
      path.moveTo(0, size.height);
      path.lineTo(size.width * 0.5, 0);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width * 0.5, size.height);
      path.lineTo(size.width, 0);
    }

    path.close();

    canvas.drawPath(
      path,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
