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
  List<String> _images;

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
              onTap: () => FileHelper.getFiles().then((ret) {
                if (ret == null) return;

                setState(() => _source = ret.paths[0]);
              }),
              child: Text('Get Image'),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            child: ImagesGroup(images: _images ?? []),
          ),
          SizedBox(height: 10),
          Center(
            child: GestureDetector(
              onTap: () => FileHelper.getFiles(allowMultiple: true).then((ret) async {
                if (ret == null || ret.count == 0) return;

                setState(() => _images = ret.paths);
              }),
              child: Text('Get Images'),
            ),
          ),
        ],
      ),
    );
  }
}
