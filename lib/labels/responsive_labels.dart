import 'package:flutter/material.dart';
import 'package:minimal/labels/label_none.dart';

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

enum LabelType { NONE, MINIMAL_LARGE, SIMPLE_TOP_CENTER }

class LabelFactory {
  final LabelType type;
  final String title;
  final String subtitle;
  final Size deviceSize;
  final Size containerSize;

  LabelFactory({
    @required this.type,
    @required this.title,
    @required this.subtitle,
    @required this.deviceSize,
    @required this.containerSize,
  });

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
          deviceSize: deviceSize,
          containerSize: containerSize,
        );
      case LabelType.NONE:
      default:
        return NoneLabel(deviceSize: deviceSize);
    }
  }

  Rect get containerRect => label.containerRect;

  Rect get deviceRect => label.deviceRect;

  Rect get labelRect => label.labelRect;

  Rect get titleRect => label.titleRect;

  Rect get subtitleRect => label.subtitleRect;
}
