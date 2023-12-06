import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color.fromRGBO(119, 124, 217, 1.0),
      // Wrapping the app with a builder method makes breakpoints
      // accessible throughout the widget tree.
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return BouncingScrollWrapper.builder(
              context, buildPage(settings.name ?? ''),
              dragWithMouse: true);
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }

  // onGenerateRoute route switcher.
  // Navigate using the page name, `Navigator.pushNamed(context, ListPage.name)`.
  Widget buildPage(String name) {
    switch (name) {
      case '/':
        return const AboutUsPage();
      case ListPage.name:
        return const ListPage();
      case PostPage.name:
        // Custom "per-page" breakpoints.
        return const PostPage();
      // return const ResponsiveBreakpoints(breakpoints: [
      //   Breakpoint(start: 0, end: 480, name: MOBILE),
      //   Breakpoint(start: 481, end: 1200, name: TABLET),
      //   Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      // ], child: PostPage());
      case TypographyPage.name:
        return const TypographyPage();
      case AboutUsPage.name:
        return const AboutUsPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
