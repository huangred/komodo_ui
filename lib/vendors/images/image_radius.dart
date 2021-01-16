import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../style/default_style.dart';

class ImageRadius extends StatelessWidget {
  ///图片地址, 可以是url string, Uint8List, File, assetName
  final dynamic source;

  ///圆角
  final BorderRadius radius;

  ///图片高度
  final double height;

  ///图片宽度
  final double width;

  //填充方式
  final BoxFit fit;

  final Function onClick;

  final EdgeInsetsGeometry margin;

  final Color backgroundColor;

  final Widget palceholder;

  final Widget errorholder;

  ImageRadius({
    Key key,
    this.source,
    this.radius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.onClick,
    this.margin,
    this.backgroundColor,
    this.palceholder,
    this.errorholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget current = ClipRRect(borderRadius: _radius, child: _image);

    current = this.margin == null ? current : Padding(padding: this.margin, child: current);

    current = this.onClick == null ? current : GestureDetector(onTap: () => this.onClick(), child: current);

    return current;
  }

  BorderRadius get _radius => this.radius ?? BorderRadius.all(Radius.circular(DefaultStyle.radiusNormal));
  double get _width => this.width;
  double get _height => this.height;
  BoxFit get _fit => this.fit ?? BoxFit.cover;

  Widget get _image {
    if (this.source is String)
      return source.toLowerCase().startsWith('http')
          ? CachedNetworkImage(
              imageUrl: this.source,
              fit: fit,
              width: this.width,
              height: this.height,
              fadeInDuration: DefaultStyle.animationDurationFast,
              fadeOutDuration: DefaultStyle.animationDurationFast,
              placeholderFadeInDuration: DefaultStyle.animationDurationFast,
              errorWidget: (context, url, error) => this.errorholder ?? _Error(height: this.height, width: this.width, backgroundColor: this.backgroundColor),
              placeholder: (context, url) => this.palceholder ?? _PlaceHolder(height: this.height, width: this.width, backgroundColor: this.backgroundColor),
            )
          : Image.asset(this.source, fit: _fit, width: _width, height: _height);

    if (this.source is File) return Image.file(this.source, fit: _fit, width: _width, height: _height);

    if (this.source is Uint8List) return Image.memory(this.source, fit: _fit, width: _width, height: _height);

    return _Error(height: this.height, width: this.width, backgroundColor: this.backgroundColor);
  }
}

class _PlaceHolder extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  const _PlaceHolder({Key key, this.height, this.width, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      alignment: Alignment.center,
      color: this.backgroundColor ?? DefaultStyle.gray3,
      child: Icon(Icons.image, color: DefaultStyle.gray5),
    );
  }
}

class _Error extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  const _Error({Key key, this.height, this.width, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      alignment: Alignment.center,
      color: this.backgroundColor ?? DefaultStyle.gray3,
      child: Icon(Icons.image_not_supported, color: DefaultStyle.gray5),
    );
  }
}
