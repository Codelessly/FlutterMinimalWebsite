import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_screens.dart';

void main() {
  runApp(ScrollWidget());
}

class ScrollWidget extends StatefulWidget {
  @override
  _ScrollWidgetState createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget>
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
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: DeviceScreens(),
          ),
        ],
      ),
    ));
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
