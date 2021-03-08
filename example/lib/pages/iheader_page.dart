import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class IBackHeaderPage extends StatefulWidget {
  IBackHeaderPage({Key key}) : super(key: key);

  @override
  _IBackHeaderPageState createState() => _IBackHeaderPageState();
}

class _IBackHeaderPageState extends State<IBackHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IBackHeaderPage'),
      ),
      body: Column(
        children: [
          IHeader(
            background: Colors.green,
            margin: EdgeInsets.zero,
          ),
          IHeader(
            background: Colors.green,
            middle: Text('Custom'),
            actions: Text('Actions'),
            height: 100,
            onBack: () => MessageBox.showTip(message: 'Click Back'),
          ),
          IHeader(
            background: Colors.green,
            child: Text('Custom Children'),
          ),
        ],
      ),
    );
  }
}
