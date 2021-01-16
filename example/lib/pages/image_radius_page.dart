import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

import 'popupmenu.dart';

class ImageRadiusPage extends StatefulWidget {
  ImageRadiusPage({Key key}) : super(key: key);

  @override
  _ImageRadiusPageState createState() => _ImageRadiusPageState();
}

class _ImageRadiusPageState extends State<ImageRadiusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Radius'),
      ),
      body: ListView(
        children: [
          Center(child: Text('Source')),
          Center(
            child: ImageRadius(
              source: 'http://auto4.sinaimg.cn/autoimg/car/16/85/131578516_950.jpg',
              height: 200,
              width: 200,
            ),
          ),
          Center(child: Text('Asset Aame')),
          Center(
            child: ImageRadius(
              source: 'assets/x7.jpg',
              height: 200,
              width: 200,
            ),
          ),
          Center(child: Text('click')),
          Center(
            child: ImageRadius(
              source: 'http://auto4.sinaimg.cn/autoimg/car/16/85/131578516_950.jpg',
              height: 200,
              width: 200,
              onClick: () => Navigation.openPage(PopupMenuPage()),
            ),
          ),
          Center(child: Text('default placeholder')),
          Center(
            child: ImageRadius(
              source: 'https://matrix.org/blog/img/2020-06-26-ml.png',
              height: 200,
              width: 200,
            ),
          ),
          Center(child: Text('custom placeholder')),
          Center(
            child: ImageRadius(
              source: 'https://matrix.org/blog/img/2020-06-26-ml.png',
              height: 200,
              width: 200,
              palceholder: Container(height: 200, width: 200, color: Colors.green, child: CupertinoActivityIndicator()),
            ),
          ),
          Center(child: Text('error')),
          Center(
            child: ImageRadius(
              source: '',
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
