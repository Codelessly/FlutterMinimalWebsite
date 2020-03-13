import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'responsive_labels.dart';

class MinimalLargeLabel extends StatelessWidget with ResponsivePreviewMixin {
  final String title;
  final String subtitle;
  final Size deviceSize;
  final double titleHeight = 250;

  MinimalLargeLabel(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.deviceSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: labelRect.width,
      height: labelRect.height,
      child: Stack(
        children: <Widget>[
          // Display Subtitle.
          if (title?.isNotEmpty ?? false)
            Positioned.fromRect(
              rect: subtitleRect,
              child: SizedBox(
                width: subtitleRect.width,
                height: subtitleRect.height,
                child: AutoSizeText(
                  subtitle ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFFDFDFDF),
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          // Display large title.
          if (title?.isEmpty ?? true)
            Positioned.fromRect(
              rect: titleRect,
              child: SizedBox(
                width: titleRect.width,
                height: titleRect.height,
                child: AutoSizeText(
                  subtitle ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          // Display small title.
          if (title?.isNotEmpty ?? false)
            Positioned.fromRect(
              rect: titleRect,
              child: SizedBox(
                width: titleRect.width,
                height: titleRect.height,
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Rect get titleRect {
    Offset titleOffset = Offset.zero;

    double titleWidth = deviceSize.shortestSide * 0.8;

    if (subtitle?.isNotEmpty ?? false) {
      titleOffset = Offset(100, 50);
    }

    return titleOffset & Size(titleWidth, titleHeight * 0.8);
  }

  Rect get subtitleRect {
    Offset subtitleOffset = Offset.zero;

    double subtitleWidth = deviceSize.shortestSide * 0.8;
    double subtitleHeight = titleHeight;

    if (subtitle?.isNotEmpty ?? false) {
    } else {
      subtitleWidth = 0;
      subtitleHeight = 0;
    }
    return subtitleOffset & Size(subtitleWidth, subtitleHeight);
  }

  Rect get deviceRect {
    Offset deviceOffset =
        Offset(titleRect.left + 50, titleRect.bottom - (titleHeight * 0.2));
    double deviceResizeRatio =
        (deviceSize.height - deviceOffset.dy) / deviceSize.height;
    Size deviceSizeNew = deviceSize * deviceResizeRatio;
    return deviceOffset & deviceSizeNew;
  }

  Rect get labelRect => titleRect.expandToInclude(subtitleRect);

  Rect get containerRect => labelRect.expandToInclude(deviceRect);
}
