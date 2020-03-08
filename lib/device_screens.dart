import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';

class ResponsivePreview extends StatefulWidget {
  ResponsivePreview({Key key}) : super(key: key);

  @override
  _ResponsivePreviewState createState() => _ResponsivePreviewState();
}

class _ResponsivePreviewState extends State<ResponsivePreview> {
  ScrollController scrollController;
  DeviceDataRepository deviceDataRepository;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    deviceDataRepository = DeviceDataRepository(deviceDataJson);
//    deviceDataRepository.addAllWithBrand("iPhone");
//    print(
//        "Active Devices: ${deviceDataRepository.activeDeviceDatas.map((e) => e.toJson().toString()).toString()}");
  }

  // TODO: Set horizontal and vertical padding.
  // Horizontal padding controls preview horizontal spacing. Control in ListView.

  @override
  Widget build(BuildContext context) {
    double verticalPadding = 50;
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 100),
      itemBuilder: (context, index) {
        DeviceData deviceData = deviceDataRepository.activeDeviceDatas[index];
        return Container(
            child: DeviceContainer(
              deviceData: deviceData,
              heightPadding: verticalPadding,
            ),
            margin:
                (index != (deviceDataRepository.activeDeviceDatas.length - 1))
                    ? EdgeInsets.only(right: 50)
                    : null);
      },
      itemCount: deviceDataRepository.activeDeviceDatas.length,
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
    print("Device Container Height: $deviceContainerHeight");
    double marginTop = 400;
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
    double deviceScreenWidth = deviceScreenSize.width;
    double deviceScreenHeight = deviceScreenSize.height;

    // TODO Calculate device positions for text positioning.
    double deviceContainerWidth = deviceScreenWidth + 400;
    // TODO Add label construct to give container enough room for label.
    Rect deviceScreenRect = Offset(400, 400) & deviceScreenSize;
    Rect deviceContainerRect =
        Offset.zero & Size(deviceContainerWidth, deviceContainerHeight);
    return Container(
      width: deviceContainerWidth,
      height: deviceContainerHeight,
      margin: EdgeInsets.symmetric(
          vertical:
              heightPadding), // TODO Move padding to deviceResizeCalc. This allows the device to exceed to not be cropped when out of screen.
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: MinimalLargeLabel(
                title: deviceData.brand,
                subtitle: deviceData.model,
                deviceSize: deviceScreenSize),
          ),
          Positioned.fromRelativeRect(
            rect: RelativeRect.fromRect(deviceScreenRect, deviceContainerRect),
            child: Container(
              width: deviceScreenWidth,
              height: deviceScreenHeight,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(72, 178, 178, 178),
                    blurRadius: 40,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Material(
                elevation: 8,
                shadowColor: Color.fromARGB(156, 178, 178, 178),
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/paper_flower_overhead_bw_w1080.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
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

enum LabelType { MINIMAL_LARGE }

class LabelFactory {
  final LabelType type;
  final String title;
  final String subtitle;
  final Size deviceSize;

  LabelFactory(
      {@required this.type,
      @required this.title,
      @required this.subtitle,
      @required this.deviceSize});

  PreviewMixin get label {
    switch (type) {
      case LabelType.MINIMAL_LARGE:
        return MinimalLargeLabel(
            title: title, subtitle: subtitle, deviceSize: deviceSize);
      // TODO Return empty no label.
      default:
        return MinimalLargeLabel(
            title: title, subtitle: subtitle, deviceSize: deviceSize);
    }
  }

  Rect get containerRect => label.containerRect;

  Rect get deviceRect => label.deviceRect;

  Rect get labelRect => label.labelRect;

  Rect get titleRect => label.titleRect;

  Rect get subtitleRect => label.subtitleRect;
}

abstract class PreviewMixin {
  factory PreviewMixin._() => null;

  get containerRect => Rect.zero;

  get deviceRect => Rect.zero;

  get labelRect => Rect.zero;

  get titleRect => Rect.zero;

  get subtitleRect => Rect.zero;
}

class MinimalLargeLabel extends StatelessWidget with PreviewMixin {
  final String title;
  final String subtitle;
  final Size deviceSize;
  final double titleHeight = 250;

  MinimalLargeLabel(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.deviceSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: labelRect.width,
      height: labelRect.height,
      child: Stack(
        children: <Widget>[
          // Subtitle.
          Positioned.fromRect(
            rect: subtitleRect,
            child: SizedBox(
              width: subtitleRect.width,
              height: subtitleRect.height,
              child: AutoSizeText(
                subtitle ?? "",
                maxLines: 1,
                maxFontSize: 400,
                minFontSize: 0,
                softWrap: false,
                style: TextStyle(
                    fontSize: 400,
                    color: Color(0xFFDFDFDF),
                    fontWeight: FontWeight.bold,
                    height: 0.9,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          // Display large title.
          if (subtitle?.isEmpty ?? true)
            Positioned.fromRect(
              rect: titleRect,
              child: SizedBox(
                width: titleRect.width,
                height: titleRect.height,
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          // Display small title.
          if (subtitle?.isNotEmpty ?? false)
            Positioned.fromRect(
              rect: titleRect,
              child: SizedBox(
                width: titleRect.width,
                height: titleRect.height,
                child: AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Rect get titleRect {
    Offset titleOffset = Offset.zero;

    double titleWidth = deviceSize.shortestSide;

    if (subtitle?.isNotEmpty ?? false) {
      titleOffset = Offset(100, 50);
    }

    return titleOffset & Size(titleWidth, titleHeight);
  }

  Rect get subtitleRect {
    Offset subtitleOffset = Offset.zero;

    double subtitleWidth = deviceSize.shortestSide;
    double subtitleHeight = titleHeight * 1.3;

    if (subtitle?.isNotEmpty ?? false) {
    } else {
      subtitleWidth = 0;
      subtitleHeight = 0;
    }
    return subtitleOffset & Size(subtitleWidth, subtitleHeight);
  }

  Rect get deviceRect {
    Offset deviceOffset =
        Offset(titleRect.left + 50, titleRect.bottom + titleHeight);
    double deviceResizeRatio =
        (deviceSize.height - deviceOffset.dy) / deviceSize.height;
    Size deviceSizeNew = deviceSize * deviceResizeRatio;
    return deviceOffset & deviceSizeNew;
  }

  Rect get labelRect => titleRect.expandToInclude(subtitleRect);

  Rect get containerRect => labelRect.expandToInclude(deviceRect);
}
