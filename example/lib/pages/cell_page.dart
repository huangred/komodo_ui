import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class CellPage extends StatefulWidget {
  CellPage({Key key}) : super(key: key);

  @override
  _CellPageState createState() => _CellPageState();
}

class _CellPageState extends State<CellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cell'),
      ),
      body: Column(
        children: [
          ICell(
            isRequired: true,
            label: '标题',
            showTrailing: true,
            content: '内容',
          ),
          ICell(
            isRequired: true,
            requredColor: Colors.transparent,
            label: '标题',
            hitText: '这是提示文本',
          ),
          ICell(
            customLabel: Text('自定义标题'),
            customContent: Padding(padding: EdgeInsets.only(left: 10), child: Text('自定义内容')),
            customTrailing: Text('自定义尾部'),
          ),
          ICell(
            isRequired: true,
            label: '标题',
            showTrailing: true,
            crossAxisAlignment: CrossAxisAlignment.start,
            customContent: Container(height: 50, padding: EdgeInsets.only(left: 10), child: Text('自定义内容')),
          ),
          ICell(),
        ],
      ),
    );
  }
}
