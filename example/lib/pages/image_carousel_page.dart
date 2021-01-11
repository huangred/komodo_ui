import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo_ui.dart';

class ImageCarouselPage extends StatefulWidget {
  ImageCarouselPage({Key key}) : super(key: key);

  @override
  _ImageCarouselPageState createState() => _ImageCarouselPageState();
}

class _ImageCarouselPageState extends State<ImageCarouselPage> {
  List<String> images = [
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
        title: Text('Image Carousel'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ImageCarousel(images: images, index: 3, child: Image.network(images[3])),
          SizedBox(height: 20),
          Expanded(child: ImageCarouselView(images: images)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
