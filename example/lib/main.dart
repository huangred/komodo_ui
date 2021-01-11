import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';
import 'pages/button_page.dart';
import 'pages/cell_page.dart';
import 'pages/image_carousel_page.dart';
import 'pages/popupmenu.dart';
import 'pages/image_radius_page.dart';
import 'pages/imagegroup_page.dart';
import 'pages/loading_page.dart';
import 'pages/messagebox_page.dart';
import 'pages/picker_page.dart';
import 'pages/price_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: Navigation.botToastInit(),
      navigatorKey: Navigation.navigatorKey,
      navigatorObservers: [Navigation.botToastNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('目录索引'), centerTitle: true),
      body: ListView(
        children: _getItems(),
      ),
    );
  }

  List<Widget> _getItems() {
    return _studyItems.map((e) => _renderItem(e)).toList();
  }

  Widget _renderItem(StudyItem item) {
    Widget current = Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(item.title),
    );

    current = InkWell(onTap: () async => await Navigation.openPage(item.page), child: current);

    return current;
  }
}

class StudyItem {
  String title;
  Widget page;
  StudyItem(this.title, this.page);
}

List<StudyItem> _studyItems = [
  StudyItem('Popup Menu', PopupMenuPage()),
  StudyItem('Image Radius', ImageRadiusPage()),
  StudyItem('Cell', CellPage()),
  StudyItem('MessageBox', MessageBoxPage()),
  StudyItem('Loading', LoadingPage()),
  StudyItem('Image Group', ImageGroupPage()),
  StudyItem('Image Carousel', ImageCarouselPage()),
  StudyItem('Button', ButtonPage()),
  StudyItem('Price', PricePage()),
  StudyItem('Picker', PickerPage()),
];
