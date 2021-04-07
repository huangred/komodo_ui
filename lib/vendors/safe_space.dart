import 'package:flutter/material.dart';

class SafeSpace extends StatelessWidget {
  final bool top;
  const SafeSpace({Key key, this.top = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !this.top ? SizedBox(height: MediaQuery.of(context).padding.bottom) : SizedBox(height: MediaQuery.of(context).padding.top);
  }
}
