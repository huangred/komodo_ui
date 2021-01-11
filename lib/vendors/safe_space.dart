import 'package:flutter/material.dart';

class SafeSpace extends StatelessWidget {
  final bool top;
  const SafeSpace({Key key, this.top = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.top == false)
      return SizedBox(height: MediaQuery.of(context).padding.bottom);
    else
      return SizedBox(height: MediaQuery.of(context).padding.top);
  }
}
