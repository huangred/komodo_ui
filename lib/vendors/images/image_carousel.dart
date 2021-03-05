import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../spinkits/circle.dart';

class ImageCarousel extends StatelessWidget {
  final List<dynamic> images;
  final int index;
  final Axis scrollDirection;
  final bool showNavigation;
  final Widget child;

  const ImageCarousel({
    Key key,
    @required this.child,
    @required this.images,
    @required this.index,
    this.scrollDirection = Axis.horizontal,
    this.showNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context /* , shadowThemeOnly: true */);

    final Widget pageChild = ImageCarouselView(
      showNavigation: showNavigation,
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      images: images,
      initialIndex: index,
      scrollDirection: scrollDirection,
    );

    return GestureDetector(
      child: this.child,
      onTap: () async => await showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Builder(builder: (BuildContext context) {
            return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
          });
        },
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black54,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}

class ImageCarouselView extends StatefulWidget {
  ImageCarouselView({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    this.showNavigation = true,
    this.showClose = true,
    @required this.images,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<dynamic> images;
  final Axis scrollDirection;
  final bool showNavigation;
  final bool showClose;

  @override
  State<StatefulWidget> createState() {
    return _ImageCarouselViewState();
  }
}

class _ImageCarouselViewState extends State<ImageCarouselView> {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(height: MediaQuery.of(context).size.height),
        child: Stack(
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.images.length,
              loadingBuilder: widget.loadingBuilder ?? (context, event) => SpinKitCircle(color: Colors.white),
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            // Positioned(
            //   left: 0,
            //   top: MediaQuery.of(context).padding.top,
            //   right: 0,
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: Container(
            //       height: 30,
            //       decoration: BoxDecoration(
            //         color: Colors.black12,
            //         borderRadius: BorderRadius.circular(Style.radiusMax),
            //       ),
            //       padding: EdgeInsets.only(
            //         left: Style.intervalNormal,
            //         top: Style.intervalSmall,
            //         right: Style.intervalNormal,
            //         bottom: Style.intervalSmall,
            //       ),
            //       margin: EdgeInsets.only(
            //         top: Style.intervalLarge,
            //       ),
            //       child: Image.asset('assets/logov.png'),
            //     ),
            //   ),
            // ),
            widget.showClose
                ? Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        margin: EdgeInsets.only(right: 20, top: kToolbarHeight),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.clear, color: Colors.white),
                      ),
                    ),
                  )
                : SizedBox(),
            widget.showNavigation
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${currentIndex + 1} / ${widget.images.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          decoration: null,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final dynamic image = widget.images[index];
    ImageProvider provider;
    if (image is String) {
      provider = NetworkImage(image);
    } else {
      provider = MemoryImage(image);
    }

    return PhotoViewGalleryPageOptions(
      imageProvider: provider,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5),
      maxScale: PhotoViewComputedScale.covered * 2,
      heroAttributes: PhotoViewHeroAttributes(tag: image),
    );
  }
}
