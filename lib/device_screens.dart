import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DeviceScreens extends StatefulWidget {
  DeviceScreens({Key key}) : super(key: key);

  @override
  _DeviceScreensState createState() => _DeviceScreensState();
}

class _DeviceScreensState extends State<DeviceScreens> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    double heightPadding = 50;
    return Scrollbar(
      child: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 100),
        children: <Widget>[
          ScreenContainer(
              text: "4K", heightPadding: heightPadding, aspectRatio: 9 / 16),
          Container(width: 100),
          ScreenContainer(
              text: "Samsung",
              subtitle: "S10",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "iPhone",
              subtitle: "X",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "iPhone",
              subtitle: "XR",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "iPhone",
              subtitle: "11 Pro",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "iPhone",
              subtitle: "11 Pro Max",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "Pixel",
              subtitle: "3",
              heightPadding: heightPadding,
              aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "QHD", heightPadding: heightPadding, aspectRatio: 9 / 20),
          Container(width: 100),
          ScreenContainer(
              text: "1080p", heightPadding: heightPadding, aspectRatio: 1 / 2),
          Container(width: 100),
          ScreenContainer(
              text: "720p", heightPadding: heightPadding, aspectRatio: 16 / 9),
          Container(width: 100),
          ScreenContainer(
              text: "480p", heightPadding: heightPadding, aspectRatio: 16 / 9),
        ],
      ),
    );
  }
}

class ScreenContainer extends StatelessWidget {
  final String text;
  final String subtitle;
  final double heightPadding;
  final double aspectRatio;

  const ScreenContainer(
      {Key key,
      this.heightPadding = 0,
      this.aspectRatio = 1,
      this.text = "",
      this.subtitle = ""})
      : super(key: key);

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
      width: deviceScreenHeight * aspectRatio + 400,
      height: screenHeight,
      margin: EdgeInsets.symmetric(vertical: heightPadding),
      child: Stack(
        children: <Widget>[
          Container(
            height: marginTop - 80,
            width: deviceScreenHeight * aspectRatio + 200,
            child: Align(
              alignment: FractionalOffset(0, 0.3),
              child: AutoSizeText(
                subtitle,
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
          if (subtitle.isEmpty)
            Container(
              height: marginTop - 80,
              width: deviceScreenHeight * aspectRatio + 200,
              child: Align(
                alignment: FractionalOffset(0, 0.3),
                child: AutoSizeText(
                  text,
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
          if (subtitle.isNotEmpty)
            Container(
              height: marginTop - 50,
              width: deviceScreenHeight * aspectRatio - 70,
              margin: EdgeInsets.only(left: 70),
              child: Align(
                alignment: FractionalOffset(0, 0.5),
                child: AutoSizeText(
                  text,
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
          Center(
            child: Container(
              width: deviceScreenHeight * aspectRatio,
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
