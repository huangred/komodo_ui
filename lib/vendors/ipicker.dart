import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import '../style/default_style.dart';

class IPickerItem {
  String text;
  dynamic value;

  IPickerItem(this.text, this.value);
}

class IPicker {
  List<IPickerItem> options;
  dynamic selected;
  Function(List<dynamic> value) confirm;

  IPicker({this.options, this.selected, this.confirm});

  Widget _picker() {
    List<PickerItem> _opts = this
        .options
        .map((e) => PickerItem(
            text: Center(child: Text(e.text, style: TextStyle(fontSize: DefaultStyle.fontSizeLarge))), value: e.value))
        .toList();

    Picker _picker = Picker(
      height: DefaultStyle.iPickerHeight,
      itemExtent: DefaultStyle.iPickerItemHeight,
      adapter: PickerDataAdapter(data: _opts),
      cancelText: '取消',
      cancelTextStyle: TextStyle(color: DefaultStyle.textColorPrimary),
      confirmText: '确定',
      confirmTextStyle: TextStyle(color: DefaultStyle.textColorPrimary),
      headerDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(DefaultStyle.radiusNormal)),
        border: Border.all(color: Color(0x1F000000), width: 0.5),
      ),
      textAlign: TextAlign.right,
      selectedTextStyle: TextStyle(color: DefaultStyle.blue),
      onConfirm: (Picker picker, List value) {
        if (this.confirm != null) this.confirm(picker.adapter.getSelectedValues());
      },
    );

    if (this.selected != null) {
      int index = _opts.indexWhere((e) => e.value == selected);
      index = index == -1 ? 0 : index;
      _picker.selecteds = [index];
    } else {
      _picker.selecteds = [0];
    }

    return _picker.makePicker();
  }

  Future show(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return _picker();
        });
  }
}

enum IPickerDateType {
  YYMMDD,
  YYMMDDHHmm,
  YYMMDDHHmmSS,
}

class IPickerDate {
  String selected;
  IPickerDateType type;
  Function(String value) confirm;

  IPickerDate({this.selected, this.confirm, this.type = IPickerDateType.YYMMDD});

  int get _type {
    if (type == IPickerDateType.YYMMDDHHmm) return PickerDateTimeType.kYMDHM;
    if (type == IPickerDateType.YYMMDDHHmmSS) return PickerDateTimeType.kYMDHMS;
    return PickerDateTimeType.kYMD;
  }

  PickerAdapter<dynamic> _getAdapter() {
    return DateTimePickerAdapter(
      type: _type,
      yearBegin: DateTime.now().year - 60,
      yearEnd: DateTime.now().year - 18,
      isNumberMonth: true,
      yearSuffix: "年",
      monthSuffix: "月",
      daySuffix: "日",
      value: DateTime.parse(this.selected ?? '${DateTime.now().year - 60}-01-01'),
    );
  }

  Widget _picker() {
    Picker _picker = Picker(
      height: DefaultStyle.iPickerHeight,
      itemExtent: DefaultStyle.iPickerItemHeight,
      adapter: _getAdapter(),
      cancelText: '取消',
      cancelTextStyle: TextStyle(color: DefaultStyle.textColorPrimary),
      confirmText: '确定',
      confirmTextStyle: TextStyle(color: DefaultStyle.textColorPrimary),
      headerDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(DefaultStyle.radiusNormal)),
        border: Border.all(color: Color(0x1F000000), width: 0.5),
      ),
      textAlign: TextAlign.right,
      selectedTextStyle: TextStyle(color: DefaultStyle.blue),
      onConfirm: (Picker picker, List value) {
        if (this.confirm != null) this.confirm(picker.adapter.text);
      },
    );

    return _picker.makePicker();
  }

  Future show(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return _picker();
        });
  }
}
