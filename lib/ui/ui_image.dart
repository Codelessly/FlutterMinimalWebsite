import 'package:flutter/widgets.dart';

class ImageFixedWidth extends StatelessWidget {
  ImageFixedWidth(this.image, this.width,
      {this.imageRatio = 1.618, this.placeholder = ""});
  final String image;
  final double width;
  final double imageRatio;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    double height = imageRatio == null ? width : imageRatio * width;

    return FadeInImage.assetNetwork(
      image: image,
      placeholder: placeholder,
      width: width,
      height: height,
      fit: BoxFit.cover,
      fadeOutDuration: Duration(milliseconds: 100),
      fadeInDuration: Duration(milliseconds: 200),
    );
  }
}
