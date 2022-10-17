import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final BuildContext? context;

  HeaderItem({
    required this.title,
    required this.onTap,
    this.context,
  });
}
