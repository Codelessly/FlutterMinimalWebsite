import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LinkedScrollControllerGroup linkedScrollControllerGroup;
  ScrollController scrollController1;
  ScrollController scrollController2;

  @override
  void initState() {
    super.initState();
    linkedScrollControllerGroup = LinkedScrollControllerGroup();
    scrollController1 = linkedScrollControllerGroup.addAndGet();
    scrollController2 = linkedScrollControllerGroup.addAndGet();
  }

  @override
  void dispose() {
    scrollController1.dispose();
    scrollController2.dispose();
    super.dispose();
  }

  void scrollToPosition(double position) {
    scrollController1.jumpTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Positioned(
              left: 20,
              top: 20,
              width: 500,
              height: 800,
              child: ScrollableContainer(
                  itemCount: 10, scrollController: scrollController1),
            ),
            Positioned(
              left: 560,
              top: 20,
              width: 500,
              height: 800,
              child: ScrollableContainer(
                  itemCount: 20, scrollController: scrollController2),
            ),
            Positioned(
              left: 20,
              top: 840,
              child: RaisedButton(
                onPressed: () => scrollToPosition(5000),
                child: Text("Scroll To"),
              ),
            ),
          ],
        ),
      ),
      theme: Theme.of(context).copyWith(platform: TargetPlatform.iOS),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScrollableContainer extends StatelessWidget {
  final int itemCount;
  final ScrollController scrollController;

  const ScrollableContainer({Key key, this.itemCount, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          color: getRandomColor(index),
        );
      },
      itemCount: itemCount,
    );
  }
}

Color getRandomColor(int index) {
  switch (index % 3) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.blue;
    case 2:
      return Colors.yellow;
    default:
      return Colors.red;
  }
}
