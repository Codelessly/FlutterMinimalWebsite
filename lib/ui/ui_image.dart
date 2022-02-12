import 'package:flutter/widgets.dart';

class ImageFixedWidth extends StatelessWidget {
  final String image;
  final double width;
  final double? imageRatio;
  final String placeholder;

  const ImageFixedWidth(this.image, this.width,
      {this.imageRatio = 1.618, this.placeholder = ""});

  @override
  Widget build(BuildContext context) {
    final double height = imageRatio == null ? width : imageRatio! * width;

    return FadeInImage.assetNetwork(
      image: image,
      placeholder: placeholder,
      width: width,
      height: height,
      fit: BoxFit.cover,
      fadeOutDuration: const Duration(milliseconds: 100),
      fadeInDuration: const Duration(milliseconds: 200),
    );
  }
}
