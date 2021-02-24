import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String _source;
  List<Asset> _images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Page'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Center(
            child: ImageRadius(
              source: _source,
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () => ImageHelper.getImage().then((ret) {
                if (ret == null) return;

                setState(() => _source = ret.path);
              }),
              child: Text('Get Image'),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text('Image Group'),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () => ImageHelper.getImages(maxImages: 9).then((ret) async {
                if (ret == null || ret.length == 0) return;

                setState(() => _images = ret);
              }),
              child: Text('Get Images'),
            ),
          ),
        ],
      ),
    );
  }
}
