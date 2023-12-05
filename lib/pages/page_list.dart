import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

// TODO Replace with object model.
const String listItemTitleText = "Creación de aplicaciones";
const String listItemPreviewText =
    "web o móviles adaptadas a las necesidades específicas de nuestros clientes.";
const String listItemTitleText2 = "Protección de información digital";
const String listItemPreviewText2 =
    "por medio de estrategias que usan muchas companias que estan en el Forbes 500 para reducción de riesgos.";
const String listItemTitleText3 = "Soluciones empresariales";
const String listItemPreviewText3 = "para base de datos, gestión y logística.";
const String listItemTitleText4 = "Servicios de consultoría";
const String listItemPreviewText4 =
    "en ciberseguridad, y en el resguardo de archivos en diversos formatos digitales.";

class ListPage extends StatelessWidget {
  static const String name = 'list';

  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: const Column(
                children: <Widget>[
                  MinimalMenuBar(),
                  ListItem(
                      imageUrl: "assets/images/coding.jpeg",
                      title: listItemTitleText,
                      description: listItemPreviewText),
                  divider,
                  ListItem(
                      imageUrl: "assets/images/protect.jpeg",
                      title: listItemTitleText2,
                      description: listItemPreviewText2),
                  divider,
                  ListItem(
                      imageUrl: "assets/images/business.jpeg",
                      title: listItemTitleText3,
                      description: listItemPreviewText3),
                  divider,
                  ListItem(
                      imageUrl: "assets/images/consult.jpeg",
                      title: listItemTitleText4,
                      description: listItemPreviewText4),
                  divider,
                  // const ListItem(
                  //     imageUrl:
                  //         "assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg",
                  //     title: listItemTitleText,
                  //     description: listItemPreviewText),
                  // divider,
                  // Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 80),
                  //   child: const ListNavigation(),
                  // ),
                  // divider,
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
