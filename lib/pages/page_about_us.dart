import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

class AboutUsPage extends StatelessWidget {
  static const String name = 'about';

  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              // color: const Color.fromRGBO(119, 124, 217, 1.0),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  const MinimalMenuBar(),
                  Container(
                    color: const Color.fromRGBO(119, 124, 217, 1.0),
                    margin: marginBottom24,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: marginBottom24,
                      child: Text("Sobre Nosotors", style: headlineTextStyle),
                      // textAlign: TextAlign.center),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     margin: marginBottom24,
                  //     child: Text("Headline Secondary",
                  //         style: headlineSecondaryTextStyle),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     margin: marginBottom24,
                  //     child: Text("Subtitle", style: subtitleTextStyle),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: marginBottom40,
                      child: Text(
                          "CAS-i es una empresa de diseño y desarrollo de software comprometida a brindar soluciones web y de aplicaciones innovadoras para las demandas más desafiantes de las industrias de nuestras ciudades fronterizas. Creando  soluciones hechas a la medida para satisfacer las demandas de los estándares y requisitos de los Estados Unidos Americanos y México.",
                          style: bodyTextStyle),
                    ),
                  ),
                  divider,
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(119, 124, 217, 1.0),
    );
  }
}
