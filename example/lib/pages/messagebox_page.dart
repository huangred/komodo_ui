import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class MessageBoxPage extends StatefulWidget {
  MessageBoxPage({Key key}) : super(key: key);

  @override
  _MessageBoxPageState createState() => _MessageBoxPageState();
}

class _MessageBoxPageState extends State<MessageBoxPage> {
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MessageBox'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(result ?? '')),
          Center(
            child: RaisedButton(
              onPressed: () async {
                var ret = await MessageBox.alert(title: '警告', content: '确定删除吗？');
                setState(() {
                  result = ret.toString();
                });
              },
              child: Text('Alert'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                var ret = await MessageBox.alert(
                  title: '警告',
                  child: Column(children: [
                    Text('确定删除吗？'),
                    Text('删除后将无法恢复。', style: TextStyle(color: DefaultStyle.textColorSecondary, fontSize: 10)),
                  ]),
                );
                setState(() {
                  result = ret.toString();
                });
              },
              child: Text('自定义内容'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () async {
                var ret = await MessageBox.show(
                  title: '提示',
                  action: ActionType.oK,
                  content: '请输入用户名称',
                  contentTextStyle: TextStyle(color: Colors.blue),
                );
                setState(() {
                  result = ret.toString();
                });
              },
              child: Text('提示'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => MessageBox.showTip(message: '正在加载...'),
              child: Text('Tip'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => MessageBox.showTip(message: '正在加载...', align: Alignment(0, 0.8)),
              child: Text('Tip Position'),
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () => MessageBox.showTip(
                  child: Text(
                    '定义模型时,你要告诉 Sequelize 有关数据库中表的一些信息. 但是,如果该表实际上不存在于数据库中怎么办？ 如果存在,但具有不同的列,较少的列或任何其他差异,该怎么办？',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  seconds: 3),
              child: Text('Custom Tip'),
            ),
          ),
        ],
      ),
    );
  }
}
