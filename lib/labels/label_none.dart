import 'package:flutter/material.dart';

import 'responsive_labels.dart';

class NoneLabel extends StatelessWidget with ResponsivePreviewMixin {
  final Size deviceSize;

  NoneLabel({Key key, @required this.deviceSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Rect get titleRect {
    return Offset.zero & Size(0, 0);
  }

  Rect get subtitleRect {
    return Offset.zero & Size(0, 0);
  }

  Rect get deviceRect {
    // Shrink to add padding to device preview so
    // shadows and corners are rendered.
    return Offset.zero & deviceSize * 0.9;
  }

  Rect get labelRect => titleRect.expandToInclude(subtitleRect);

  Rect get containerRect => labelRect.expandToInclude(deviceRect);
}
