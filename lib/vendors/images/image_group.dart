import 'package:flutter/material.dart';
import '../../utils/image_helper.dart';
import '../../style/default_style.dart';
import 'image_radius.dart';
import '../../utils/extensions/string_extension.dart';

class ImagesGroup extends StatelessWidget {
  final List<String> images;

  ///剪裁的宽高比，默认16:9
  final double ratio;

  ///只有一张图片且是竖图时，剪裁的宽高比，默认3:4
  final double vertiaclRatio;

  ///间距
  final double space;

  const ImagesGroup({Key key, @required this.images, this.ratio, this.space, this.vertiaclRatio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images == null || images.length == 0) return Container();

    Widget current = LayoutBuilder(builder: (context, size) => _renderImages(size.maxWidth));

    return current;
  }

  double get _ratio => this.ratio ?? 16 / 9;
  double get _vertiaclRatio => this.vertiaclRatio ?? 3 / 4;
  double get _space => this.space ?? DefaultStyle.intervalXSmall;
  Radius get _radius => Radius.circular(DefaultStyle.radiusNormal);

  Widget _renderImages(double maxWidth) {
    int imageCount = images.length;
    double width = maxWidth;
    double height = width / this._ratio;

    if (imageCount == 1) {
      return FutureBuilder(
        future: ImageHelper.getImageSize(images[0]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            double w = snapshot.data.width;
            double h = snapshot.data.height;
            if (w < h) //竖图
            {
              width = maxWidth * 0.5;
              height = width / this._vertiaclRatio;
            }

            return _renderImage(width: width, height: height, url: images[0]);
          }

          return _renderImage(width: width, height: height, url: images[0]);
        },
      );
    }

    if (imageCount == 2) {
      double _width = (width - _space) / 2;

      return Row(
        children: <Widget>[
          _renderImage(
              url: images[0], width: _width, height: height, borderRadius: BorderRadius.horizontal(left: _radius)),
          SizedBox(width: _space),
          _renderImage(
              url: images[1], width: _width, height: height, borderRadius: BorderRadius.horizontal(right: _radius)),
        ],
      );
    }

    if (imageCount == 3) {
      double _width = (width - _space) / 2;
      double _height = (height - _space) / 2;

      return Row(
        children: <Widget>[
          _renderImage(
              url: images[0], width: _width, height: height, borderRadius: BorderRadius.horizontal(left: _radius)),
          SizedBox(width: _space),
          Column(
            children: <Widget>[
              _renderImage(
                  url: images[1], width: _width, height: _height, borderRadius: BorderRadius.only(topRight: _radius)),
              SizedBox(height: _space),
              _renderImage(
                  url: images[2],
                  width: _width,
                  height: _height,
                  borderRadius: BorderRadius.only(bottomRight: _radius)),
            ],
          ),
        ],
      );
    }
    if (imageCount == 4) {
      double _width = (width - _space) / 2;
      double _height = (height - _space) / 2;

      return Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _renderImage(
                  url: images[0], width: _width, height: _height, borderRadius: BorderRadius.only(topLeft: _radius)),
              SizedBox(height: _space),
              _renderImage(
                  url: images[2], width: _width, height: _height, borderRadius: BorderRadius.only(bottomLeft: _radius)),
            ],
          ),
          SizedBox(width: _space),
          Column(
            children: <Widget>[
              _renderImage(
                  url: images[1], width: _width, height: _height, borderRadius: BorderRadius.only(topRight: _radius)),
              SizedBox(height: _space),
              _renderImage(
                  url: images[3],
                  width: _width,
                  height: _height,
                  borderRadius: BorderRadius.only(bottomRight: _radius)),
            ],
          ),
        ],
      );
    }

    if (imageCount > 4) {
      double _width = (width - _space * 2) / 3;
      double _height = _width;

      return Wrap(
        spacing: _space,
        runSpacing: _space,
        children: List.generate(
          imageCount,
          (index) =>
              _renderImage(url: images[index], width: _width, height: _height, borderRadius: BorderRadius.all(_radius)),
        ),
      );
    }

    return Container();
  }

  Widget _renderImage({String url, double width, double height, BorderRadius borderRadius}) {
    Widget placeHolder = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: url.toColor),
    );

    Widget image = ImageRadius(
      source: url,
      width: width,
      height: height,
      radius: borderRadius,
      palceholder: placeHolder,
      errorholder: placeHolder,
    );

    return image;
  }
}
