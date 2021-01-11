import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class PickerPage extends StatefulWidget {
  PickerPage({Key key}) : super(key: key);

  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  int height;
  String birthday;
  String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picker'),
      ),
      body: Column(
        children: [
          ICell(
            label: '身高',
            content: height == null || height == -1 ? '' : height.toString() + 'cm',
            showTrailing: true,
            onClick: () {
              var picker = IPicker(
                selected: height,
                confirm: (value) => setState(() => height = value[0]),
                options: [
                  IPickerItem('请选择', -1),
                  IPickerItem('160cm', 160),
                  IPickerItem('162cm', 162),
                  IPickerItem('164cm', 164),
                  IPickerItem('166cm', 166),
                  IPickerItem('168cm', 168),
                  IPickerItem('170cm', 170),
                  IPickerItem('172cm', 172),
                  IPickerItem('174cm', 174),
                  IPickerItem('176cm', 176),
                  IPickerItem('178cm', 178),
                ],
              );
              picker.show(context);
            },
          ),
          ICell(
            label: '生日',
            content: birthday ?? '',
            showTrailing: true,
            onClick: () {
              var picker = IPickerDate(
                selected: birthday,
                confirm: (value) => setState(() => birthday = value.substring(0, 10)),
              );
              picker.show(context);
            },
          ),
          ICell(
            label: '日期',
            content: date ?? '',
            showTrailing: true,
            onClick: () {
              var picker = IPickerDate(
                selected: date,
                type: IPickerDateType.YYMMDDHHmmSS,
                confirm: (value) => setState(() => date = value.substring(0, 19)),
              );
              picker.show(context);
            },
          ),
        ],
      ),
    );
  }
}
