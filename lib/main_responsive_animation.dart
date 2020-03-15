import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal/responsive_animation_2.dart';

void main() {
  runApp(ResponsiveAnimationApp());
}

class ResponsiveAnimationApp extends StatefulWidget {
  @override
  _ResponsiveAnimationAppState createState() => _ResponsiveAnimationAppState();
}

class _ResponsiveAnimationAppState extends State<ResponsiveAnimationApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ResponsiveAnimation2(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
