import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class TagPage extends StatefulWidget {
  TagPage({Key key}) : super(key: key);

  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tag'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              SizedBox(width: 10),
              ITag(title: 'Default', type: ITagType.Default),
              ITag(title: 'Primary', type: ITagType.Primary),
              ITag(title: 'Danger', type: ITagType.Danger),
              ITag(title: 'Info', type: ITagType.Info),
              ITag(title: 'Random', type: ITagType.Random),
              ITag(title: 'Random x', type: ITagType.Random),
              ITag(title: 'Success', type: ITagType.Success),
              ITag(title: 'Warning', type: ITagType.Warning),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              SizedBox(width: 10),
              ITag(title: 'XLarge', type: ITagType.Primary, size: ITagSize.XLarge),
              ITag(title: 'Large', type: ITagType.Primary, size: ITagSize.Large),
              ITag(title: 'Normal', type: ITagType.Primary, size: ITagSize.Normal),
              ITag(title: 'Small', type: ITagType.Primary, size: ITagSize.Small),
              ITag(title: 'XSmall', type: ITagType.Primary, size: ITagSize.XSmall),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              SizedBox(width: 10),
              ITag(
                title: 'Custom',
                titleColor: DefaultStyle.red,
                fontSize: 24,
                backgroundColor: DefaultStyle.gray6,
                borderColor: DefaultStyle.green,
                radius: 12,
              ),
              ITag(
                title: 'Custom',
                titleColor: DefaultStyle.red,
                fontSize: 24,
                backgroundColor: DefaultStyle.gray5,
                showBorder: true,
                borderColor: DefaultStyle.green,
              ),
              ITag(
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    Text('LOCK'),
                    Icon(Icons.person),
                  ],
                ),
                backgroundColor: DefaultStyle.gray5,
                showBorder: true,
                borderColor: DefaultStyle.green,
              ),
              Builder(
                builder: (context) => ITag(
                  title: 'Click',
                  backgroundColor: DefaultStyle.gray5,
                  showBorder: true,
                  borderColor: DefaultStyle.green,
                  onClick: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('一枚有态度的程序员'),
                    ));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
