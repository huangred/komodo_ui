import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class DateTimePage extends StatefulWidget {
  DateTimePage({Key key}) : super(key: key);

  @override
  _DateTimePageState createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateTime.now().format()),
          Text(DateTime.now().format(formatter: DateTimeFormatter.mmddyyHHmm)),
          Text(DateTime.now().toTime()),
          Text(DateTime.now().toTimeline()),
          Text(DateTime.now().add(Duration(days: -1)).toTimeline()),
          Text(DateTime.now().add(Duration(days: -10)).toTimeline()),
          Text(DateTime.now().add(Duration(days: -365)).toTimeline()),
          Text(DateTime.now().sameEnvironment(DateTime.now().add(Duration(minutes: -3))).toString()),
          Text(DateTime.now().sameEnvironment(DateTime.now().add(Duration(minutes: -30))).toString()),
          Text(DateTime.now() <= DateTime.now().add(Duration(minutes: -30)) ? '小于' : '大于'),
        ],
      ),
    );
  }
}
