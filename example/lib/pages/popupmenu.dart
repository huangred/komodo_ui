import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class PopupMenuPage extends StatefulWidget {
  PopupMenuPage({Key key}) : super(key: key);

  @override
  _PopupMenuPageState createState() => _PopupMenuPageState();
}

class _PopupMenuPageState extends State<PopupMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu'),
        actions: [
          IPopupMenu(
            child: Icon(Icons.more_horiz),
            meunItems: _getItems(),
          ),
          IPopupMenu(
            child: Icon(Icons.more_vert),
            meunItems: _getItems(),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
          SizedBox(height: 20),
          IPopupMenu(
            child: Container(
              width: 350,
              height: 60,
              color: Colors.green,
              child: Text('Click'),
            ),
            meunItems: _getItems(),
          ),
        ],
      ),
      // Stack(
      //   children: [
      //     for (double x = -1; x <= 1; x = x + 0.5)
      //       for (double y = -1; y <= 1; y = y + 0.25) Align(alignment: Alignment(x, y), child: _menu('$x, $y')),
      //   ],
      // ),
    );
  }

  Widget _menu(String text) {
    return IPopupMenu(
      child: Container(
        color: Colors.green,
        child: Text(text),
      ),
      meunItems: _getItems(),
      //maskColor: Colors.pink,
      // backgroundColor: Colors.red,
      // dividerColor: Colors.green,
    );
  }

  List<MenuItem> _getItems() {
    return [
      MenuItem(
        iconData: Icons.delete_outline,
        title: '删除',
        click: () {},
      ),
      // MenuItem(
      //   title: '无图标',
      //   click: () {},
      // ),
      // MenuItem(
      //   icon: Icon(Icons.delete_outline, color: Colors.blue),
      //   title: '自定义图标',
      //   click: () {},
      // ),
      // MenuItem(
      //   iconData: Icons.delete_outline,
      //   titleWidget: Text('自定义标题', style: TextStyle(color: Colors.green)),
      //   click: () {},
      // ),
      // MenuItem(child: Container(child: Row(children: [Text('自定义菜单项', style: TextStyle(color: Colors.white))]))),
      // MenuItem(
      //   iconData: Icons.delete_outline,
      //   title: '删除',
      //   click: () {},
      // ),
    ];
  }
}
