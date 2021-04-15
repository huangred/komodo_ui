import 'package:flutter/material.dart';

class MenuItem {
  MenuItem({this.iconData, this.icon, this.title, this.titleWidget, this.click, this.child});

  IconData iconData;
  Icon icon;

  String title;
  Text titleWidget;

  Function click;

  Widget child;
}

enum ArrowPosition {
  Left,
  Top,
  Right,
  Bottom,
}

class IPopupMenu extends StatefulWidget {
  final List<MenuItem> meunItems;
  final ArrowPosition arrowPosition;
  final Widget child;
  final double arrowHeight;
  final double arrowWidth;
  final double radius;
  final double menuLeftOffset;
  final double menuTopOffset;
  final double menuBottomOffset;
  final double arrowLeftOffset;
  final double arrowTopOffset;
  final double arrowBottomOffset;
  final EdgeInsetsGeometry itemPadding;

  final Color maskColor;
  final Color backgroundColor;
  final Color dividerColor;
  final bool longPress;
  final HitTestBehavior behavior;
  IPopupMenu({
    @required this.child,
    @required this.meunItems,
    this.arrowPosition,
    this.arrowWidth = 16.0,
    this.arrowHeight = 8.0,
    this.radius = 3,
    this.menuLeftOffset = 0.0,
    this.menuTopOffset = 0.0,
    this.menuBottomOffset = 0.0,
    this.arrowLeftOffset = 0.0,
    this.arrowTopOffset = 0.0,
    this.arrowBottomOffset = 0.0,
    this.itemPadding,
    this.maskColor,
    this.backgroundColor,
    this.dividerColor,
    this.longPress = false,
    this.behavior,
  });
  @override
  _IPopupMenuState createState() => _IPopupMenuState();
}

class _IPopupMenuState extends State<IPopupMenu> {
  RenderObject renderObject;
  OverlayEntry entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      renderObject = context.findRenderObject();
      // size = renderObject.paintBounds.size;
      // vector3 = renderObject.getTransformTo(null)?.getTranslation();
    });
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
        onLongPress: widget.longPress ? onTap : null,
        onTap: widget.longPress ? null : onTap,
      ),
    );
  }

  void onTap() {
    Widget menuWidget = _RenderPopupMenu(
      meunItems: widget.meunItems,
      arrowPosition: widget.arrowPosition,
      child: widget.child,
      arrowHeight: widget.arrowHeight,
      arrowWidth: widget.arrowWidth,
      radius: widget.radius,
      menuLeftOffset: widget.menuLeftOffset,
      menuTopOffset: widget.menuTopOffset,
      menuBottomOffset: widget.menuBottomOffset,
      arrowLeftOffset: widget.arrowLeftOffset,
      arrowTopOffset: widget.arrowTopOffset,
      arrowBottomOffset: widget.arrowBottomOffset,
      itemPadding: widget.itemPadding,
      renderObject: renderObject,
      maskColor: widget.maskColor,
      backgroundColor: widget.backgroundColor,
      dividerColor: widget.dividerColor,
      onRemove: () => removeOverlay(),
    );

    entry = OverlayEntry(builder: (context) => menuWidget);

    Overlay.of(context).insert(entry);
  }

  void removeOverlay() {
    entry.remove();
    entry = null;
  }
}

class _RenderPopupMenu extends StatefulWidget {
  final List<MenuItem> meunItems;
  final ArrowPosition arrowPosition;
  final Widget child;
  final double arrowHeight;
  final double arrowWidth;
  final double radius;
  final double menuLeftOffset;
  final double menuTopOffset;
  final double menuBottomOffset;
  final double arrowLeftOffset;
  final double arrowTopOffset;
  final double arrowBottomOffset;
  final EdgeInsetsGeometry itemPadding;
  final Color maskColor;
  final Color backgroundColor;
  final Color dividerColor;
  final Function onRemove;
  final RenderObject renderObject;

  _RenderPopupMenu({
    @required this.child,
    @required this.meunItems,
    this.arrowPosition,
    this.arrowWidth,
    this.arrowHeight,
    this.radius,
    this.menuLeftOffset,
    this.menuTopOffset,
    this.menuBottomOffset,
    this.arrowLeftOffset,
    this.arrowTopOffset,
    this.arrowBottomOffset,
    this.itemPadding,
    this.maskColor,
    this.backgroundColor,
    this.dividerColor,
    this.onRemove,
    this.renderObject,
  });
  @override
  _RenderPopupMenuState createState() => _RenderPopupMenuState();
}

class _RenderPopupMenuState extends State<_RenderPopupMenu> {
  ArrowPosition _arrowPosition;
  GlobalKey _key = GlobalKey();
  double maxWidth;
  Size size;
  dynamic vector3;

  void _onAfterRendering(Duration timeStamp) {
    final RenderBox renderBox = _key.currentContext.findRenderObject();
    maxWidth = renderBox.size.width;

    setState(() {});
  }

  @override
  void initState() {
    size = widget.renderObject.paintBounds.size;
    vector3 = widget.renderObject.getTransformTo(null)?.getTranslation();

    WidgetsBinding.instance.addPostFrameCallback(_onAfterRendering);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _showMenu();
  }

  Widget _showMenu() {
    final double w = size.width;
    final double h = size.height;
    final double dx = vector3[0];
    final double dy = vector3[1];
    final double screenW = MediaQuery.of(context).size.width;
    final double screenH = MediaQuery.of(context).size.height;

    final bool isTop = dy < screenH / 2;
    final bool isLeft = dx < screenW / 2;

    double menuLeft, menuTop, menuBottom;
    double arrowLeft, arrowTop, arrowBottom;

    if (_arrowPosition == null) _arrowPosition = isTop ? ArrowPosition.Top : ArrowPosition.Bottom;

    if (_arrowPosition == ArrowPosition.Right) {
      menuLeft = dx - widget.arrowHeight;
      menuTop = isTop ? dy : null;
      menuBottom = isTop ? null : (screenH - dy - h);

      arrowLeft = dx - widget.arrowHeight;
      arrowTop = isTop ? dy + h / 2 - widget.arrowWidth / 2 : null;
      arrowBottom = isTop ? null : (screenH - dy - h / 2 - widget.arrowWidth / 2);
    }

    if (_arrowPosition == ArrowPosition.Left) {
      menuLeft = dx + w + widget.arrowHeight;
      menuTop = isTop ? dy : null;
      menuBottom = isTop ? null : (screenH - dy - h);

      arrowLeft = dx + w;
      arrowTop = isTop ? dy + h / 2 - widget.arrowWidth / 2 : null;
      arrowBottom = isTop ? null : (screenH - dy - h / 2 - widget.arrowWidth / 2);
    }

    if (_arrowPosition == ArrowPosition.Top) {
      arrowLeft = (dx + w / 2 - widget.arrowWidth / 2) + widget.arrowLeftOffset;
      arrowTop = dy + h + widget.arrowTopOffset;

      if (isLeft)
        menuLeft = arrowLeft - widget.arrowWidth + widget.menuLeftOffset;
      else
        menuLeft = arrowLeft - (maxWidth ?? 0) + widget.arrowWidth * 1.5 + widget.menuLeftOffset;

      menuTop = arrowTop + widget.arrowHeight + widget.menuTopOffset;
    }

    if (_arrowPosition == ArrowPosition.Bottom) {
      arrowLeft = dx + w / 2 - widget.arrowWidth / 2;
      arrowBottom = screenH - dy;

      if (isLeft)
        menuLeft = arrowLeft - widget.arrowWidth + widget.menuLeftOffset;
      else
        menuLeft = arrowLeft - (maxWidth ?? 0) + widget.arrowWidth * 1.5 + widget.menuLeftOffset;

      menuBottom = arrowBottom + widget.arrowHeight;
    }

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Material(
        color: widget.maskColor ?? Colors.transparent,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Text(''),
                ),
                onTap: () => widget.onRemove(),
              ),
              Positioned(
                left: menuLeft,
                top: menuTop,
                bottom: menuBottom,
                child: Container(
                  key: _key,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), color: widget.backgroundColor ?? Color(0xFF323232)),
                  child: _renderMenuPanel(),
                ),
              ),
              Positioned(
                left: arrowLeft,
                top: arrowTop,
                bottom: arrowBottom,
                child: ClipPath(
                  clipper: _Triangle(_arrowPosition),
                  child: Container(
                    width: _arrowPosition == ArrowPosition.Left || _arrowPosition == ArrowPosition.Right ? widget.arrowHeight : widget.arrowWidth,
                    height: _arrowPosition == ArrowPosition.Top || _arrowPosition == ArrowPosition.Bottom ? widget.arrowHeight : widget.arrowWidth,
                    color: widget.backgroundColor ?? Color(0xFF323232),
                    child: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderMenuPanel() {
    List<Widget> items = widget.meunItems.map(_buildItem).toList();
    List<Widget> children = [];

    int len = items.length;

    for (var i = 0; i < len; i++) {
      children.add(items[i]);
      if (i < len - 1) children.add(Container(width: maxWidth, color: widget.dividerColor ?? Colors.white12, height: 0.5));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: children);
  }

  Widget _buildItem(MenuItem item) {
    if (item.child != null) return item.child;

    Widget icon = item.icon ?? (item.iconData == null ? Icon(Icons.menu, color: Colors.transparent) : Icon(item.iconData, color: Colors.white));

    Widget title = item.titleWidget ?? Text(item.title, style: TextStyle(color: Colors.white));

    Widget current = Row(children: [icon, SizedBox(width: 5), title]);

    current = Container(
      padding: widget.itemPadding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: maxWidth,
      child: current,
    );

    current = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        item.click?.call();
      },
      child: current,
    );

    return current;
  }
}

class _Triangle extends CustomClipper<Path> {
  ArrowPosition arrowPosition;
  _Triangle(this.arrowPosition);
  @override
  Path getClip(Size size) {
    var path = Path();
    double w = size.width;
    double h = size.height;

    if (arrowPosition == ArrowPosition.Right) {
      path.moveTo(0, 0);
      path.lineTo(w, h / 2);
      path.lineTo(0, h);
    }

    if (arrowPosition == ArrowPosition.Left) {
      path.moveTo(w, 0);
      path.lineTo(0, h / 2);
      path.lineTo(w, h);
    }

    if (arrowPosition == ArrowPosition.Top) {
      path.moveTo(0, h);
      path.lineTo(w / 2, 0);
      path.lineTo(w, h);
    }

    if (arrowPosition == ArrowPosition.Bottom) {
      path.moveTo(0, 0);
      path.lineTo(w / 2, h);
      path.lineTo(w, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
