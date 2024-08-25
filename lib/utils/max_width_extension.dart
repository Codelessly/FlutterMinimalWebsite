import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension MaxWidthExtension on List<Widget> {
  List<Widget> toMaxWidth() {
    return map(
      (item) => MaxWidthBox(
        maxWidth: 1200,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        backgroundColor: Colors.white,
        child: item,
      ),
    ).toList();
  }

  List<Widget> toMaxWidthSliver() {
    return map(
      (item) => SliverToBoxAdapter(
        child: MaxWidthBox(
          maxWidth: 1200,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          backgroundColor: Colors.white,
          child: item,
        ),
      ),
    ).toList();
  }
}
