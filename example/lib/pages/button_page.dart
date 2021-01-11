import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class ButtonPage extends StatefulWidget {
  ButtonPage({Key key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              IButton(caption: 'Default'),
              IButton(caption: 'Danger', type: IButtonType.Danger),
              IButton(caption: 'Info', type: IButtonType.Info),
              IButton(caption: 'Primary', type: IButtonType.Primary),
              IButton(caption: 'Success', type: IButtonType.Success),
              IButton(caption: 'Warning', type: IButtonType.Warning),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              IButton(caption: 'XSmall', size: IButtonSize.XSmall),
              IButton(caption: 'Small', size: IButtonSize.Small),
              IButton(caption: 'Normal', size: IButtonSize.Normal),
              IButton(caption: 'Large', size: IButtonSize.Large),
              IButton(caption: 'XLarge', size: IButtonSize.XLarge),
            ],
          ),
          SizedBox(height: 10),
          LayoutBuilder(builder: (context, constraints) => IButton(caption: 'Expanded', width: constraints.maxWidth)),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              IButton(
                caption: 'Click Loading',
                loading: _isLoading,
                loadText: _isLoading ? '处理中...' : '',
                onClick: () {
                  setState(() => _isLoading = true);

                  Future.delayed(Duration(seconds: 3), () => setState(() => _isLoading = false));
                },
              ),
              IButton(
                caption: 'Icon',
                prefix: Icon(Icons.add, color: Colors.white),
                suffix: Icon(Icons.delete, color: Colors.white),
              ),
              IButton(
                caption: 'BoxShadow',
                boxShadow: [DefaultStyle.boxShadow],
              ),
            ],
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              IButton(
                caption: 'Circle',
                circle: true,
                width: 80,
                height: 80,
              ),
              IButton(
                caption: 'Disabled',
                disabled: true,
              ),
              IButton(
                caption: 'Custom',
                backgroundColor: DefaultStyle.pink,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
