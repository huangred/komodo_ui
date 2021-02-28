import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_native_resizer/image_native_resizer.dart';
import 'navigation.dart';
import 'debug.dart';

class ImageHelper {
  ///获取图片的宽高值, source可以是url或者Uint8List
  static Future<Size> getImageSize(dynamic source) async {
    Completer<Size> completer = Completer();

    Image image = source is String ? Image.network(source) : Image.memory(source);

    ImageStream imageStream = image.image.resolve(ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener((ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      }, onError: (exception, stackTrace) {
        LogHelper.err(exception, stackTrace: stackTrace);
        completer.completeError(Size(-1, -1));
      }),
    );

    return completer.future;
  }

  ///生成图片缩略图
  static Future<String> resize({String imagePath, double maxWidth = 1600, double maxHeight = 1200, int quality = 100}) async {
    String ret = await ImageNativeResizer.resize(
      imagePath: imagePath,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      quality: quality,
    );

    return ret;
  }

  ///图片剪裁
  static Future crop(String imageFilePath, {double ratioX, double ratioY}) async {
    dynamic image = await ImageCropper.cropImage(
        sourcePath: imageFilePath,
        cropStyle: CropStyle.rectangle,
        aspectRatio: CropAspectRatio(ratioX: ratioX ?? 1.0, ratioY: ratioY ?? 1.0),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: '图片编辑',
          toolbarColor: Theme.of(Navigation.context).primaryColor,
          statusBarColor: Theme.of(Navigation.context).primaryColor,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
          hideBottomControls: false,
        ),
        iosUiSettings: IOSUiSettings(title: '图片编辑', aspectRatioLockDimensionSwapEnabled: true, rotateButtonsHidden: true, rotateClockwiseButtonHidden: true));

    return image;
  }
}
