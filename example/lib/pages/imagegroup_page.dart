import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class ImageGroupPage extends StatefulWidget {
  ImageGroupPage({Key key}) : super(key: key);

  @override
  _ImageGroupPageState createState() => _ImageGroupPageState();
}

class _ImageGroupPageState extends State<ImageGroupPage> {
  List<String> images = [
    //'https://images.pexels.com/photos/2486168/pexels-photo-2486168.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://1.bp.blogspot.com/-hL18ZDhWqTs/X47L3aHX0fI/AAAAAAABMD4/HLIsvOEbL9klf2QrbfCfkneUpWHzVu4IACLcBGAsYHQ/s2643/hqld64q3zss51.jpg',
    'https://steamuserimages-a.akamaihd.net/ugc/940586530515504757/CDDE77CB810474E1C07B945E40AE4713141AFD76/',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3185819925,1793045537&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2510551897,2815346549&fm=26&gp=0.jpg',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb.zol-img.com.cn%2Fdesk%2Fbizhi%2Fimage%2F1%2F1680x1050%2F1349289433496.jpg&refer=http%3A%2F%2Fb.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338548&t=ae33a2deb27cef401af3b87dbbbfaf0b',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3300550661,1121971374&fm=11&gp=0.jpg',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201401%2F29%2F204244x47qloku7krbjr48.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338553&t=39dc5c2be95f92fd61b6c9c055b602d0',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201205%2F03%2F01400598djmyeczcskh2yr.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338554&t=03290192465170a7bb7ed047da3b04f5',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fsoftbbs%2F1003%2F07%2Fc0%2F3134443_1267900790753_1024x1024soft.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338557&t=314fa53bbf6212f3278f7185645f8dad',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201111%2F21%2F205700txzuacubbcy91u99.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338561&t=71851e621c6e319c0479352a38cec726',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattachments.gfan.com%2Fforum%2Fattachments2%2Fday_120819%2F12081912519c9e412bfe5e33c6.jpg&refer=http%3A%2F%2Fattachments.gfan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612338677&t=dd278d297aadec97e61940fc23a502b0',
  ];

  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Group'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Align(alignment: Alignment.centerLeft, child: ImagesGroup(images: images.sublist(3, 4))),
          SizedBox(height: 20),
          Align(alignment: Alignment.centerLeft, child: ImagesGroup(images: images.sublist(4, 5))),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 4)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 5)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 6)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 7)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 8)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 9)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 10)),
          SizedBox(height: 20),
          ImagesGroup(images: images.sublist(2, 11)),
        ],
      ),
    );
  }
}
