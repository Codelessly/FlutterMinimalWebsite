import 'package:flutter/cupertino.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:minimal/utils/utils_image.dart';

class ImageFixedWidth extends StatefulWidget {
  static const String name = 'ImageFixedWidth';

  final String imageUrl;
  final double width;
  final double imageRatio;

  const ImageFixedWidth(
      {super.key,
      required this.imageUrl,
      required this.width,
      this.imageRatio = 1});

  @override
  ImageFixedWidthState createState() => ImageFixedWidthState();
}

class ImageFixedWidthState extends State<ImageFixedWidth> {
  bool imagesLoaded = false;
  bool preloadedImages = false;

  @override
  void didUpdateWidget(ImageFixedWidth oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      preloadedImages = false;
      imagesLoaded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!preloadedImages) {
      preloadedImages = true;
      ImageUtils.preloadNetworkImages(context, [
        widget.imageUrl,
      ]).whenComplete(() {
        if (mounted) {
          imagesLoaded = true;
          setState(() {});
        }
      });
    }

    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = (width * widget.imageRatio).roundToDouble();
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            if (imagesLoaded == false)
              const Center(
                child: Center(child: CupertinoActivityIndicator(radius: 16)),
              ),
            FadeInImage.assetNetwork(
              image: widget.imageUrl,
              placeholder: placeholderEmpty,
              width: width,
              height: height,
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(milliseconds: 100),
              fadeInDuration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      );
    });
  }
}
