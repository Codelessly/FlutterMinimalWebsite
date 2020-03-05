import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:minimal/device_data.dart';

class DeviceScreens extends StatefulWidget {
  DeviceScreens({Key key}) : super(key: key);

  @override
  _DeviceScreensState createState() => _DeviceScreensState();
}

class _DeviceScreensState extends State<DeviceScreens> {
  ScrollController scrollController;
  DeviceDataRepository deviceDataRepository;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    deviceDataRepository = DeviceDataRepository(deviceDataJson);
    deviceDataRepository.addAllWithBrand("iPhone");
    print(
        "Active Devices: ${deviceDataRepository.activeDeviceDatas.map((e) => e.toJson().toString()).toString()}");
  }

  @override
  Widget build(BuildContext context) {
    double verticalPadding = 50;
    return Scrollbar(
      child: ListView.builder(
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
      ),
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
    double screenHeight =
        MediaQuery.of(context).size.height - (heightPadding * 2);
    print("Screen Height: $screenHeight");
    double marginTop = 400;
    // Scaled device height.
    // Calculated based on window height and maximum
    // allowed width.
    double deviceScreenHeight = screenHeight - marginTop;
    return Container(
      width: deviceScreenHeight * deviceData.aspectRatio + 400,
      height: screenHeight,
      margin: EdgeInsets.symmetric(vertical: heightPadding),
      child: Stack(
        children: <Widget>[
          Container(
            height: marginTop - 80,
            width: deviceScreenHeight * deviceData.aspectRatio + 200,
            child: Align(
              alignment: FractionalOffset(0, 0.3),
              child: AutoSizeText(
                deviceData.model ?? "",
                maxLines: 1,
                maxFontSize: 400,
                minFontSize: 0,
                style: TextStyle(
                    fontSize: 400,
                    color: Color(0xFFDFDFDF),
                    height: 0.9,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat"),
              ),
            ),
          ),
          if (deviceData.model?.isEmpty ?? true)
            SizedBox(
              height: marginTop - 80,
              width: deviceScreenHeight * deviceData.aspectRatio + 200,
              child: Align(
                alignment: FractionalOffset(0, 0.3),
                child: AutoSizeText(
                  deviceData.brand ?? "",
                  maxLines: 1,
                  maxFontSize: 400,
                  minFontSize: 0,
                  style: TextStyle(
                      fontSize: 400,
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat"),
                ),
              ),
            ),
          if ((deviceData.model?.isEmpty ?? true) == false)
            SizedBox(
              height: marginTop - 50,
              width: deviceScreenHeight * deviceData.aspectRatio - 70,
              child: Container(
                margin: EdgeInsets.only(left: 70),
                child: Align(
                  alignment: FractionalOffset(0, 0.5),
                  child: AutoSizeText(
                    deviceData.brand ?? "",
                    maxLines: 1,
                    maxFontSize: 400,
                    minFontSize: 0,
                    wrapWords: false,
                    style: TextStyle(
                        fontSize: 400,
                        color: Color(0xFF757575),
                        height: 0.9,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat"),
                  ),
                ),
              ),
            ),
          Center(
            child: Container(
              width: deviceScreenHeight * deviceData.aspectRatio,
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
}
