import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'labels/labels.dart';
import 'pages/pages.dart';

class ResponsiveAnimationMulti extends StatefulWidget {
  ResponsiveAnimationMulti({Key key}) : super(key: key);

  @override
  _ResponsiveAnimationMultiState createState() =>
      _ResponsiveAnimationMultiState();
}

class _ResponsiveAnimationMultiState extends State<ResponsiveAnimationMulti>
    with SingleTickerProviderStateMixin {
  bool animating = false;
  bool crossFadeState = true;
  AnimationController _controller;
  Animation<double> width;
  Animation<double> height;
  DeviceDataRepository deviceDataRepository;
  int activeDeviceIndex = 0;

  @override
  void initState() {
    super.initState();
    deviceDataRepository = DeviceDataRepository(deviceDataJson, activeDevices: [
      "720p",
      "HD",
      "4K",
      "iPad Pro 12.9\"",
      "iPhone 11 Pro",
      "iPad Pro 11\"",
      "Pro Display XDR",
      "Pixel 4",
      "Galaxy S20",
      "4K",
      "HD",
      "720p",
    ]);
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextAnimation();
      }
    });
    width = Tween<double>(
      begin: deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width,
      end: deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    height = Tween<double>(
      begin: deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height,
      end: deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double verticalPadding = 50;
    double horizontalPadding = 50;
    return Stack(
      children: <Widget>[
        Container(color: Colors.white),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              firstChild: titleText(getTitleText()),
              secondChild: titleText(getTitleText2()),
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeIn,
              crossFadeState: crossFadeState
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 250),
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 500),
              firstChild: subtitleText(getSubtitleText()),
              secondChild: subtitleText(getSubTitleText2()),
              firstCurve: Curves.easeIn,
              secondCurve: Curves.easeIn,
              crossFadeState: crossFadeState
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 350),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return DeviceContainer(
                  deviceData: DeviceData(
                      brand: "",
                      model: "",
                      width: width.value,
                      height: height.value,
                      physicalSize: deviceDataRepository
                          .activeDeviceDatas[activeDeviceIndex].physicalSize,
                      devicePixelRatio: deviceDataRepository
                          .activeDeviceDatas[activeDeviceIndex]
                          .devicePixelRatio),
                  maxHeight: MediaQuery.of(context).size.height - 350,
                  heightPadding: verticalPadding,
                  widthPadding: horizontalPadding,
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

  String getTitleText() {
    return crossFadeState
        ? activeDeviceIndex == 0
            ? deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name
            : deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name
        : activeDeviceIndex == 0
            ? deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name
            : deviceDataRepository
                .activeDeviceDatas[activeDeviceIndex - 1].name;
  }

  String getTitleText2() {
    return crossFadeState
        ? activeDeviceIndex == 0
            ? deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name
            : deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].name
        : activeDeviceIndex == 0
            ? deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name
            : deviceDataRepository.activeDeviceDatas[activeDeviceIndex].name;
  }

  String getSubtitleText() {
    return crossFadeState
        ? activeDeviceIndex == 0
            ? "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}"
            : "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}"
        : activeDeviceIndex == 0
            ? "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}"
            : "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].height.round()}";
  }

  String getSubTitleText2() {
    return crossFadeState
        ? activeDeviceIndex == 0
            ? "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}"
            : "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].height.round()}"
        : activeDeviceIndex == 0
            ? "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}"
            : "${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width.round()} x ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex].height.round()}";
  }

  void playAnimation() {
    nextAnimation();
    setState(() {
      animating = true;
    });
  }

  void nextAnimation() {
    Future.delayed(Duration(milliseconds: 1000), () {
      if (activeDeviceIndex <
          deviceDataRepository.activeDeviceDatas.length - 1) {
        setState(() {
          crossFadeState = !crossFadeState;
          activeDeviceIndex += 1;
          print(
              "Active Device: ${deviceDataRepository.activeDeviceDatas[activeDeviceIndex - 1].name}");
          width = Tween<double>(
            begin: deviceDataRepository
                .activeDeviceDatas[activeDeviceIndex - 1].width,
            end:
                deviceDataRepository.activeDeviceDatas[activeDeviceIndex].width,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
          ));
          height = Tween<double>(
            begin: deviceDataRepository
                .activeDeviceDatas[activeDeviceIndex - 1].height,
            end: deviceDataRepository
                .activeDeviceDatas[activeDeviceIndex].height,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
          ));
          _controller.forward(from: 0);
        });
      } else {
        resetAnimation();
      }
    });
  }

  void resetAnimation() {
    setState(() {
      animating = false;
      activeDeviceIndex = 0;
    });
  }
}

Widget titleText(String text) {
  return SizedBox(
    width: 1200,
    height: 200,
    child: Align(
      alignment: Alignment.bottomCenter,
      child: AutoSizeText(
        text ?? "",
        maxLines: 1,
        maxFontSize: 400,
        minFontSize: 0,
        softWrap: false,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 400,
            color: Color(0xFF757575),
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat"),
      ),
    ),
  );
}

Widget subtitleText(String text) {
  return SizedBox(
    width: 1200,
    height: 100,
    child: Align(
      alignment: Alignment.topCenter,
      child: AutoSizeText(
        text ?? "",
        maxLines: 1,
        maxFontSize: 400,
        minFontSize: 0,
        softWrap: false,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 400,
            color: Color(0xFFDFDFDF),
            height: 0.9,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat"),
      ),
    ),
  );
}

class DeviceContainer extends StatelessWidget {
  final DeviceData deviceData;
  final double maxHeight;
  final double widthPadding;
  final double heightPadding;

  const DeviceContainer({
    Key key,
    @required this.deviceData,
    @required this.maxHeight,
    this.widthPadding = 0,
    this.heightPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = maxHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    double deviceContainerHeight = screenHeight - (heightPadding * 2);
    double deviceContainerWidth = screenWidth - (widthPadding * 2);
    Size containerSize = Size(deviceContainerWidth, deviceContainerHeight);

    Size deviceScreenSize = deviceScreenSizeCalc(
        deviceData: deviceData,
        containerWidth: deviceContainerWidth,
        containerHeight: deviceContainerHeight);

    print("Screen Dimensions: $screenWidth , $screenHeight");
    print("Device Size: $deviceScreenSize");

    LabelFactory labelFactory = LabelFactory(
        type: LabelType.NONE,
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

    return Container(
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
                          minWidth: 450,
                          defaultScale: true,
                          breakpoints: [
                            ResponsiveBreakpoint(breakpoint: 450, name: MOBILE),
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
    );
  }

  Size deviceScreenSizeCalc(
      {DeviceData deviceData, double containerWidth, double containerHeight}) {
    if (deviceData.height > containerHeight ||
        containerWidth / deviceData.aspectRatio > containerHeight)
      return Size(containerHeight * deviceData.aspectRatio, containerHeight);

    return deviceData.aspectRatio >= 1
        ? Size(containerWidth, containerWidth / deviceData.aspectRatio)
        : Size(containerHeight * deviceData.aspectRatio, containerHeight);
  }
}
