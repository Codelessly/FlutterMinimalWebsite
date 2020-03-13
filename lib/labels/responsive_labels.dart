import 'package:flutter/material.dart';

import 'label_minimal.dart';
import 'label_simple.dart';

abstract class ResponsivePreviewMixin {
  factory ResponsivePreviewMixin._() => null;

  get containerRect => Rect.zero;

  get deviceRect => Rect.zero;

  get labelRect => Rect.zero;

  get titleRect => Rect.zero;

  get subtitleRect => Rect.zero;
}

enum LabelType { MINIMAL_LARGE, SIMPLE_TOP_CENTER }

class LabelFactory {
  final LabelType type;
  final String title;
  final String subtitle;
  final Size deviceSize;

  LabelFactory(
      {@required this.type,
      @required this.title,
      @required this.subtitle,
      @required this.deviceSize});

  ResponsivePreviewMixin get label {
    switch (type) {
      case LabelType.MINIMAL_LARGE:
        return MinimalLargeLabel(
            title: title, subtitle: subtitle, deviceSize: deviceSize);
      case LabelType.SIMPLE_TOP_CENTER:
        return SimpleLabel(
            type: SimpleLabelType.TOP_CENTER,
            title: title,
            subtitle: subtitle,
            deviceSize: deviceSize);
      // TODO Return empty no label.
      default:
        return MinimalLargeLabel(
            title: title, subtitle: subtitle, deviceSize: deviceSize);
    }
  }

  Rect get containerRect => label.containerRect;

  Rect get deviceRect => label.deviceRect;

  Rect get labelRect => label.labelRect;

  Rect get titleRect => label.titleRect;

  Rect get subtitleRect => label.subtitleRect;
}
