import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'labels/labels.dart';
import 'pages/pages.dart';

class ResponsiveAnimationCombined extends StatefulWidget {
  ResponsiveAnimationCombined({Key key}) : super(key: key);

  @override
  _ResponsiveAnimationCombinedState createState() =>
      _ResponsiveAnimationCombinedState();
}

class _ResponsiveAnimationCombinedState
    extends State<ResponsiveAnimationCombined> {
  static double initialWidth = 1280;
  static double initialHeight = 720;
  double startValue = initialWidth;
  double endValue = initialWidth;
  int duration = 5;
  bool animating = false;

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
    double verticalPadding = 50;
    double horizontalPadding = 50;
    return Stack(
      children: <Widget>[
        Container(color: Colors.white),
        Center(
          child: Container(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: startValue, end: endValue),
              duration: Duration(seconds: duration),
              onEnd: () => setState(() => animating = false),
              builder: (BuildContext context, value, Widget child) {
                double heightCalc = initialHeight;
                return ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  shrinkWrap: true,
                  children: <Widget>[
                    DeviceContainer(
                      deviceData: DeviceData(
                          brand: "SCALE",
                          model: "${value.round()} x ${heightCalc.round()}",
                          width: value,
                          height: heightCalc,
                          physicalSize: 6.4,
                          devicePixelRatio: 1),
                      heightPadding: verticalPadding,
                      widthPadding: horizontalPadding,
                    ),
                    DeviceContainer(
                      deviceData: DeviceData(
                          brand: "RESIZE",
                          model: "${value.round()} x ${heightCalc.round()}",
                          width: value,
                          height: heightCalc,
                          physicalSize: 6.4,
                          devicePixelRatio: 1),
                      heightPadding: verticalPadding,
                      widthPadding: horizontalPadding,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () => playAnimation(),
                icon: animating
                    ? Icon(null, color: Color(0xFFDFDFDF))
                    : Icon(Icons.play_circle_outline, color: Color(0xFFDFDFDF)),
                iconSize: 48,
              ),
              IconButton(
                onPressed: () => resetAnimation(),
                icon: animating
                    ? Icon(null, color: Color(0xFFDFDFDF))
                    : Icon(Icons.replay, color: Color(0xFFDFDFDF)),
                iconSize: 48,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void playAnimation() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        animating = true;
        startValue = initialWidth;
        endValue = 360;
        duration = 5;
      });
    });
  }

  void resetAnimation() {
    setState(() {
      animating = false;
      startValue = initialWidth;
      endValue = initialWidth;
      duration = 0;
    });
  }
}

class DeviceContainer extends StatelessWidget {
  final DeviceData deviceData;
  final double widthPadding;
  final double heightPadding;

  const DeviceContainer({
    Key key,
    @required this.deviceData,
    this.widthPadding = 0,
    this.heightPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double deviceContainerHeight = screenHeight - (heightPadding * 2);
    double deviceContainerWidth = screenWidth - (widthPadding * 2);
    Size containerSize = Size(deviceContainerWidth, deviceContainerHeight);

    Size deviceScreenSize = deviceScreenSizeCalc(
        aspectRatio: deviceData.aspectRatio,
        containerWidth: deviceContainerWidth,
        containerHeight: deviceContainerHeight);

    print("Screen Dimensions: $screenWidth , $screenHeight");
    print("Device Size: $deviceScreenSize");

    LabelFactory labelFactory = LabelFactory(
        type: LabelType.SIMPLE_TOP_CENTER,
        title: deviceData.brand,
        subtitle: deviceData.model,
        deviceSize: deviceScreenSize,
        containerSize: containerSize);

    // Center container
    // TODO: Create centering methods.
    double centerVerticalOffset = 0;
    if (true) {
      centerVerticalOffset =
          deviceContainerHeight / 2 - labelFactory.containerRect.center.dy;
    }

    double previewScale =
        deviceData.scaledSize.width / labelFactory.deviceSize.width;

    return Center(
      child: Container(
        width: labelFactory.containerRect.width +
            labelFactory.containerRect.topLeft.dx,
        height: labelFactory.containerRect.height +
            labelFactory.containerRect.topLeft.dy,
        margin: EdgeInsets.only(
            top: heightPadding * 0.5,
            bottom: heightPadding * 1.5,
            left: widthPadding * 0.5,
            right: widthPadding *
                0.5), // TODO: Move padding to deviceResizeCalc. This allows the device to exceed to not be cropped when out of screen.
        child: Stack(
          children: <Widget>[
            Positioned.fromRect(
                rect: labelFactory.labelRect,
                child: labelFactory.label as Widget),
            Positioned.fromRect(
              rect: labelFactory.deviceRect,
              child: Container(
                width: labelFactory.deviceSize.width,
                height: labelFactory.deviceSize.height,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: kIsWeb
                          ? Color.fromARGB(72, 178, 178, 178)
                          : Color.fromARGB(156, 178, 178, 178),
                      blurRadius: kIsWeb ? 40 : 60,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Material(
                  elevation: 8,
                  shadowColor: kIsWeb
                      ? Color.fromARGB(156, 178, 178, 178)
                      : Color.fromARGB(10, 178, 178, 178),
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: MediaQuery(
                      data: MediaQueryData(
                          size: labelFactory.deviceSize * previewScale,
                          devicePixelRatio: deviceData.devicePixelRatio),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                          width: labelFactory.deviceSize.width * previewScale,
                          height: labelFactory.deviceSize.height * previewScale,
                          child: ResponsiveWrapper(
                            maxWidth: 1200,
                            minWidth: 800,
                            defaultScale: deviceData.brand == "SCALE",
                            breakpoints: [],
                            background: Container(
                              color: Color(0xFFF5F5F5),
                            ),
                            child: BouncingScrollWrapper.builder(
                                context, ListPage()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size deviceScreenSizeCalc(
      {double aspectRatio, double containerWidth, double containerHeight}) {
    return aspectRatio >= 1
        ? Size(containerWidth / 2, containerWidth / aspectRatio / 2)
        : Size(containerHeight * aspectRatio, containerHeight);
  }
}
