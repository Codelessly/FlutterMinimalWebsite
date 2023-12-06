import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';

class PostPage extends StatelessWidget {
  static const String name = 'post';

  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: <Widget>[
              const MinimalMenuBar(),
              // const ImageWrapper(
              //   image: "assets/images/web-logo-cas-i.png",
              // ),
              Image.asset("assets/images/web-logo-cas-i.png"),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: marginBottom12,
                  child: Text(
                    "Creando aplicaciones web increíbles y aplicaciones móviles seguras",
                    style: headlineTextStyle,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBodySecondary(text: "Nuestra mision:"),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: TextBody(
                    text:
                        "En el mundo actual, tanto las aplicaciones web como las móviles se han convertido en elementos esenciales para las empresas y los particulares. Sin embargo, no todas las aplicaciones son creadas iguales. Algunas son simplemente buenas, mientras que otras son realmente increíbles. Si quieres ser increible, ponte en contacto con nosotros"),
              ),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: TextBody(
              //       text:
              //           "Montes nascetur ridiculus mus mauris vitae ultricies leo. Vitae purus faucibus ornare suspendisse sed nisi lacus sed viverra. Magna sit amet purus gravida. In dictum non consectetur a erat nam. Et egestas quis ipsum suspendisse ultrices. Tempor orci dapibus ultrices in iaculis nunc sed augue. Feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam. Feugiat nisl pretium fusce id velit ut tortor pretium."),
              // ),
              const Align(
                alignment: Alignment.centerLeft,
                child:
                    TextHeadlineSecondary(text: "casi@casimplementation.com"),
              ),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: TextBody(
              //       text:
              //           "Nullam lobortis faucibus cursus. Sed aliquam semper mi sit amet interdum. Aliquam felis quam, ultrices ut elementum a, porta vel ex. Pellentesque at tempus magna. Vestibulum viverra lectus quis laoreet ullamcorper. Nunc finibus orci in luctus hendrerit. Ut dui mi, lacinia hendrerit elit ut, malesuada luctus enim."),
              // ),
              // const TextBlockquote(
              //     text:
              //         "Arcu ac tortor dignissim convallis aenean et tortor. Neque vitae tempus quam pellentesque nec nam aliquam. Dictum varius duis at consectetur lorem donec massa sapien faucibus. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. Ac odio tempor orci dapibus ultrices in iaculis nunc sed."),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: TextBody(
              //       text:
              //           "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus quam. Nec nam aliquam sem et tortor consequat. Suspendisse interdum consectetur libero id faucibus nisl. Ornare suspendisse sed nisi lacus sed viverra. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Egestas purus viverra accumsan in nisl nisi."),
              // ),
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: TagWrapper(tags: [
              //     Tag(tag: "Writing"),
              //     Tag(tag: "Photography"),
              //     Tag(tag: "Development")
              //   ]),
              // ),
              // ...authorSection(
              //     imageUrl: "assets/images/avatar_default.png",
              //     name: "Type Pages",
              //     bio:
              //         "Mattis molestie a iaculis at erat pellentesque adipiscing commodo. Suspendisse interdum consectetur libero id faucibus nisl tincidunt eget. Sed euismod nisi porta lorem. Aliquet nec ullamcorper sit amet risus nullam eget felis eget."),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 80),
              //   child: const PostNavigation(),
              // ),
              // divider,
              // Footer
              const Footer(),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(119, 124, 217, 1.0),
    );
  }
}
