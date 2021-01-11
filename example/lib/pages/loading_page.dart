import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              onPressed: () => Loading.show(),
              child: Text('show'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => Loading.show(message: '正在处理中...'),
              child: Text('show message'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => Loading.show(
                backgroundColor: Colors.black54,
                child: SpinKitCircle(),
              ),
              child: Text('show custom'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Loading.show();
                Future.delayed(Duration(seconds: 3), () => Loading.hide());
              },
              child: Text('Close'),
            ),
          ),
          Center(child: Loading.showIndicator()),
        ],
      ),
    );
  }
}
