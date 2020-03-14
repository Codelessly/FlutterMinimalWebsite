import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'labels/labels.dart';
import 'pages/pages.dart';

class ResponsiveAnimation extends StatefulWidget {
  ResponsiveAnimation({Key key}) : super(key: key);

  @override
  _ResponsiveAnimationState createState() => _ResponsiveAnimationState();
}

class _ResponsiveAnimationState extends State<ResponsiveAnimation> {
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
    double verticalPadding = 100;
    return Stack(
      children: <Widget>[
        Container(color: Colors.white),
        Container(
          child: DeviceContainer(
            deviceData: DeviceData(
                brand: "SCALE",
                model: "768 x 1280",
                width: 768,
                height: 1280,
                physicalSize: 6.4,
                devicePixelRatio: 1),
            heightPadding: verticalPadding,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[],
          ),
        ),
      ],
    );
  }
}

class DeviceContainer extends StatelessWidget {
  final DeviceData deviceData;
  final double heightPadding;

  const DeviceContainer({
    Key key,
    @required this.deviceData,
    this.heightPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Height available for device container.
    // Screen height minus height padding.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double deviceContainerHeight = screenHeight - (heightPadding * 2);
    // Constrain the maximum width within a range
    // calculated from the device width and height.
    // If the width of the screen is too narrow
    // (i.e. on a phone), the preview width is allowed
    // to exceed the width of the phone.
    // A maximum width aspect ratio limit is set to
    // fit a reasonable portion of wide displays in the
    // preview area.
    Size deviceScreenSize = deviceScreenSizeCalc(
        maxWidthRatio: 1,
        boundaryWidthRatio: 1 / 2,
        minHeightPercentage: 2 /
            3, // TODO Automatically calculate this value from screen aspect ratio. This percentage helps control how much of the preview fits on the device screen.
        aspectRatio: deviceData.aspectRatio,
        containerHeight: deviceContainerHeight);

    LabelFactory labelFactory = LabelFactory(
        type: LabelType.SIMPLE_TOP_CENTER,
        title: deviceData.brand,
        subtitle: deviceData.model,
        deviceSize: deviceScreenSize);

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
        width: labelFactory.containerRect.width,
        height: labelFactory.containerRect.height,
        margin: EdgeInsets.only(
            top: heightPadding * 0.5,
            bottom: heightPadding *
                1.5), // TODO: Move padding to deviceResizeCalc. This allows the device to exceed to not be cropped when out of screen.
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
                            minWidth: 450,
                            defaultScale: true,
                            breakpoints: [
                              ResponsiveBreakpoint(
                                  breakpoint: 450, name: MOBILE),
                              ResponsiveBreakpoint(
                                  breakpoint: 800, name: TABLET, scale: true),
                              ResponsiveBreakpoint(
                                  breakpoint: 1000, name: TABLET, scale: true),
                              ResponsiveBreakpoint(
                                  breakpoint: 1200, name: DESKTOP),
                              ResponsiveBreakpoint(
                                  breakpoint: 2460, name: "4K", scale: true),
                            ],
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

  /// Calculate the dimensions for the device size.
  ///
  /// Calculate the appropriate dimensions by working
  /// backwards from device size constraints.
  /// The purpose of setting device size constraints
  /// is to fit device preview on the preview screen
  /// in a way the user expects.
  ///
  /// The [maxWidthRatio], [boundaryWidthRatio],
  /// and [minHeightPercentage] approximate a
  /// solver function to maximize the device preview
  /// size and fit the maximum portion of the device
  /// on the preview screen. When the [aspectRatio]
  /// of the device preview exceeds the [boundaryWidthRatio],
  /// the device height begins to shrink, up to the
  /// [minHeightPercentage].
  ///
  /// Returns the device preview [Size].
  Size deviceScreenSizeCalc(
      {double maxWidthRatio,
      double boundaryWidthRatio,
      double minHeightPercentage,
      double aspectRatio,
      double containerHeight}) {
    // TODO: Add asserts to force correct inputs for calculations.
    if (aspectRatio > maxWidthRatio)
      return Size(containerHeight * minHeightPercentage * aspectRatio,
          containerHeight * minHeightPercentage);

    if (aspectRatio > boundaryWidthRatio) {
      double heightPercentageCalc =
          1 - (aspectRatio - boundaryWidthRatio) * (1 - minHeightPercentage);
      return Size(containerHeight * heightPercentageCalc * aspectRatio,
          containerHeight * heightPercentageCalc);
    }

    return Size(containerHeight * aspectRatio, containerHeight);
  }
}
