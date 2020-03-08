import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_screens.dart';

void main() {
  runApp(ResponsivePreviewApp());
}

class ResponsivePreviewApp extends StatefulWidget {
  @override
  _ResponsivePreviewAppState createState() => _ResponsivePreviewAppState();
}

class _ResponsivePreviewAppState extends State<ResponsivePreviewApp>
    with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print("Init State");
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: Colors.white),
            ResponsivePreview(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Wrap MaterialApp in scrolling container that
// matches the height of the contents.
//final materialApp = MaterialApp(
//  home: SingleChildScrollView(
//    controller: scrollController,
//    child: Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Flexible(
//            fit: FlexFit.loose,
//            child: Container(width: 250, height: 250, color: Colors.amber)),
//      ],
//    ),
//  ),
//  theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
//  debugShowCheckedModeBanner: false,
//);

// Initialize screen.
//    final textWidget = Text("Hello, this is sample text");
//    final materialApp = MaterialApp(
//      home: SingleChildScrollView(
//        controller: scrollController,
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Flexible(
//                fit: FlexFit.loose,
//                child: Container(width: 250, height: 250, color: Colors.amber)),
//          ],
//        ),
//      ),
//      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
//      debugShowCheckedModeBanner: false,
//    );
