import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'labels/labels.dart';
import 'pages/pages.dart';

class ResponsivePreview extends StatefulWidget {
  ResponsivePreview({Key key}) : super(key: key);

  @override
  _ResponsivePreviewState createState() => _ResponsivePreviewState();
}

class _ResponsivePreviewState extends State<ResponsivePreview> {
  ScrollController scrollController;
  DeviceDataRepository deviceDataRepository;
  Timer scrollTimer;
  bool scrolling = false;
  bool firstScrollStart = true;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    deviceDataRepository = DeviceDataRepository(deviceDataJson, activeDevices: [
      "iPhone 11 Pro Max",
      "iPhone X",
      "iPad Pro 11\"",
      "Galaxy S20 Ultra",
      "Pixel 4",
      "Pro Display XDR",
      "iPhone 11 Pro Max",
      "iPhone X",
      "iPad Pro 11\"",
      "Galaxy S20 Ultra",
      "Pixel 4",
      "Pro Display XDR",
    ]);
  }

  @override
  void dispose() {
    scrollTimer.cancel();
    scrollController.dispose();
    super.dispose();
  } // TODO: Set horizontal and vertical padding.
  // Horizontal padding controls preview horizontal spacing. Control in ListView.

  @override
  Widget build(BuildContext context) {
    double verticalPadding = 100;
    return Stack(
      children: <Widget>[
        Container(color: Colors.white),
        ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 100),
          itemBuilder: (context, index) {
            DeviceData deviceData =
                deviceDataRepository.activeDeviceDatas[index];
            return Container(
                child: DeviceContainer(
                  deviceData: deviceData,
                  heightPadding: verticalPadding,
                ),
                margin: (index !=
                        (deviceDataRepository.activeDeviceDatas.length - 1))
                    ? EdgeInsets.only(right: 100)
                    : null);
          },
          itemCount: deviceDataRepository.activeDeviceDatas.length,
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () => scrolling ? stopScroll() : startScroll(),
                icon: scrolling
                    ? Icon(null, color: Color(0xFFDFDFDF))
                    : Icon(Icons.play_circle_outline, color: Color(0xFFDFDFDF)),
                iconSize: 48,
              ),
              IconButton(
                onPressed: () => resetScroll(),
                icon: scrolling
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

  void startScroll() {
    if (firstScrollStart) {
      firstScrollStart = false;
      Future.delayed(Duration(seconds: 1), () => startScroll());
      return;
    }
    if (kIsWeb) {
      // Timer Method.
      scrollTimer = Timer.periodic(
          Duration(microseconds: ((1 / 30) * 1000).round()), (timer) {
        if (scrollController.offset >=
            scrollController.position.maxScrollExtent) {
          stopScroll();
        }
        scrollController.jumpTo(scrollController.offset + 10);
      });
    } else {
      // Scroll Controller Method.
      scrollController
          .animateTo(scrollController.offset + 1250,
              duration: Duration(seconds: 3), curve: Curves.linear)
          .then((value) {
        print("Continue scroll");
        if (scrolling == false ||
            scrollController.offset >=
                scrollController.position.maxScrollExtent) {
          stopScroll();
        } else {
          startScroll();
        }
      });
    }

    setState(() {
      scrolling = true;
    });
  }

  void stopScroll() {
    print("Stop scroll");
    if (kIsWeb) {
      // Timer Method.
      scrollTimer.cancel();
    } else {
      // Scroll Controller Method.
      scrollController.animateTo(scrollController.offset,
          duration: Duration(seconds: 0), curve: Curves.linear);
    }

    setState(() {
      scrolling = false;
    });
  }

  void resetScroll() {
    print("Reset scroll");
    stopScroll();
    firstScrollStart = true;
    scrollController.jumpTo(0);
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double deviceContainerWidth = screenWidth - (heightPadding * 2);
    double deviceContainerHeight = screenHeight;
    Size containerSize = Size(deviceContainerWidth, deviceContainerHeight);
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
      deviceSize: deviceScreenSize,
      containerSize: containerSize,
    );

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
