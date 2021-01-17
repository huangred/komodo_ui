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
        body: ListView(
          children: [
            getChildren(true),
            SizedBox(height: 20),
            getChildren(false),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _menu('left'),
                _menu('center'),
                _menu('right'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _menu('left'),
                _menu('center'),
                _menu('right'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _menu('left'),
                _menu('center'),
                _menu('right'),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.grey,
              child: Text('xxxxxxxxxxxx'),
              height: 600,
            ),
          ],
        ));
  }

  Widget getChildren(bool left) {
    return Column(
      crossAxisAlignment: left ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        IPopupMenu(
          child: Container(
            width: 50,
            height: 60,
            color: Colors.green,
            child: Text('Click'),
          ),
          meunItems: _getItems(),
        ),
        SizedBox(height: 20),
        IPopupMenu(
          child: Container(
            width: 100,
            height: 60,
            color: Colors.green,
            child: Text('Click'),
          ),
          meunItems: _getItems(),
        ),
        SizedBox(height: 20),
        IPopupMenu(
          child: Container(
            width: 150,
            height: 60,
            color: Colors.green,
            child: Text('Click'),
          ),
          meunItems: _getItems(),
        ),
        SizedBox(height: 20),
        IPopupMenu(
          child: Container(
            width: 200,
            height: 60,
            color: Colors.green,
            child: Text('Click'),
          ),
          meunItems: _getItems(),
        ),
        SizedBox(height: 20),
        IPopupMenu(
          child: Container(
            width: 250,
            height: 60,
            color: Colors.green,
            child: Text('Click'),
          ),
          meunItems: _getItems(),
        ),
        SizedBox(height: 20),
        IPopupMenu(
          child: Container(
            width: 300,
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
