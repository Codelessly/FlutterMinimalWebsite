import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'responsive_labels.dart';

enum SimpleLabelType { TOP_CENTER }

class SimpleLabel extends StatelessWidget with ResponsivePreviewMixin {
  final SimpleLabelType type;
  final String title;
  final String subtitle;
  final Size deviceSize;
  final double labelHeight = 200;

  SimpleLabel(
      {Key key,
      @required this.type,
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
          // Display title
          Positioned.fromRect(
            rect: titleRect,
            child: SizedBox(
              width: titleRect.width,
              height: titleRect.height,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  maxFontSize: 200,
                  minFontSize: 0,
                  softWrap: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          ),
          // Display Subtitle.
          if (subtitle?.isNotEmpty ?? false)
            Positioned.fromRect(
              rect: subtitleRect,
              child: SizedBox(
                width: subtitleRect.width,
                height: subtitleRect.height,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    subtitle ?? "",
                    maxLines: 1,
                    maxFontSize: 200,
                    minFontSize: 0,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 400,
                        color: Color(0xFFDFDFDF),
                        height: 0.9,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Rect get titleRect {
    Offset titleOffset = Offset.zero;

    double titleWidth = deviceSize.shortestSide;

    return titleOffset & Size(titleWidth, labelHeight);
  }

  Rect get subtitleRect {
    Offset subtitleOffset = Offset.zero;

    double subtitleWidth = deviceSize.shortestSide * 0.8;
    double subtitleHeight = labelHeight * 0.8;

    if (title?.isNotEmpty) {
      subtitleOffset = Offset(deviceSize.shortestSide * 0.1, labelHeight);
    }

    if (subtitle?.isNotEmpty ?? false) {
    } else {
      subtitleWidth = 0;
      subtitleHeight = 0;
    }
    return subtitleOffset & Size(subtitleWidth, subtitleHeight);
  }

  Rect get deviceRect {
    Offset labelBottomCenter = labelRect.bottomCenter;
    double deviceResizeRatio =
        (deviceSize.height - labelRect.bottom - 50) / deviceSize.height;
    Size deviceSizeNew = deviceSize * deviceResizeRatio;
    Offset deviceTopCenter = deviceSizeNew.topCenter(Offset(0, -50));
    Offset deviceOffsetNew = labelBottomCenter - deviceTopCenter;

    return deviceOffsetNew & deviceSizeNew;
  }

  Rect get labelRect => titleRect.expandToInclude(subtitleRect);

  Rect get containerRect => labelRect.expandToInclude(deviceRect);
}
