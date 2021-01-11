import 'dart:async';

import 'package:flutter/material.dart';

import 'debug.dart';

class ImageHelper {
  ///获取图片的宽高值
  static Future<Size> getImageSize(String imageUrl) async {
    Completer<Size> completer = Completer();

    Image image = Image.network(imageUrl);
    ImageStream imageStream = image.image.resolve(ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener((ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      }, onError: (exception, stackTrace) {
        LogHelper.err(exception, stackTrace);
        completer.completeError(Size(-1, -1));
      }),
    );

    return completer.future;
  }

  ///选取单张图片
  static Future getImage() async {}

  ///选取多张图片
  static Future getImages() async {}

  ///图片剪裁
  static Future crop(double ratioX, double ratioY) async {}
}
