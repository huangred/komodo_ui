import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_native_resizer/image_native_resizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'navigation.dart';
import 'permission_helper.dart';
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

  ///选取单张图片
  static Future<PickedFile> getImage() async {
    bool hasPermission = await PermissionHelper.checkAlbum();
    if (!hasPermission) return null;

    PickedFile image = await ImagePicker().getImage(source: ImageSource.gallery);
    return image;
  }

  ///选取多张图片
  static Future<List<Asset>> getImages({int maxImages, List<Asset> selectedAssets, bool enableCamera}) async {
    bool _check = await PermissionHelper.checkAlbum();
    if (_check == false) return null;

    // _check = await PermissionHelper.checkImageLocation();
    // if (_check == false) return null;

    List<Asset> assets = await MultiImagePicker.pickImages(
      maxImages: maxImages,
      selectedAssets: selectedAssets ?? List<Asset>(),
      enableCamera: enableCamera ?? false,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        selectionLimitReachedText: '最多可以选择$maxImages张图片',
        startInAllView: true,
        useDetailsView: true,
        allViewTitle: '全部图片',
        textOnNothingSelected: '请选择图片',
        selectCircleStrokeColor: "#ffffff",
        actionBarColor: "#FFC300",
        statusBarColor: "#FFC300",
        lightStatusBar: true,
        actionBarTitleColor: '#ffffff',
      ),
    );

    return assets;
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
