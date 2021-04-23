import 'package:example/pages/route_animation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class RouteAnimationPage extends StatefulWidget {
  RouteAnimationPage({Key key}) : super(key: key);

  @override
  _RouteAnimationPageState createState() => _RouteAnimationPageState();
}

class _RouteAnimationPageState extends State<RouteAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Animation')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () => Navigation.open(SecondPage(), type: RouteType.none),
              child: Text(
                'Default',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () => Navigation.open(SecondPage(), type: RouteType.popUp),
              child: Text(
                'PopUp From Bottom',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () => Navigation.open(SecondPage(), type: RouteType.slide),
              child: Text(
                'Slide From Right',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () => Navigation.open(SecondPage(), type: RouteType.fade),
              child: Text(
                'Fade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
