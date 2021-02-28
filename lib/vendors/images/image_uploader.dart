import 'package:flutter/material.dart';

class ImageUploader extends StatefulWidget {
  ///是否显示选择图片的图标
  final bool showUploadIcon;

  ///是否开启图片多选
  final bool multiple;
  final List<String> images;

  ///最大上传数量限制
  final int maxCount;

  ImageUploader({
    Key key,
    this.images,
    this.showUploadIcon = true,
    this.multiple = true,
    this.maxCount = 9,
  }) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Image Uploader'),
    );
  }
}
