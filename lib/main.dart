import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:minimal/pages/pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrapping the app with a builder method makes breakpoints
      // accessible throughout the widget tree.
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      initialRoute: '/',
      onGenerateInitialRoutes: (initialRoute) => [
        MaterialPageRoute(
            settings: RouteSettings(name: initialRoute),
            builder: (context) {
              String sanitizedRoute =
                  initialRoute != '/' && initialRoute.startsWith('/')
                      ? initialRoute.substring(1)
                      : initialRoute;

              return BouncingScrollWrapper.builder(
                  context, buildPage(sanitizedRoute),
                  dragWithMouse: true);
            })
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: RouteSettings(name: '/${settings.name}'),
            builder: (context) {
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
    return MaxWidthBox(
        // A widget that limits the maximum width.
        // This is used to create a gutter area on either side of the content.
        maxWidth: 1200,
        background: Container(color: const Color(0xFFF5F5F5)),
        child: switch (name) {
          '/' || ListPage.name => const ListPage(),
          PostPage.name =>
            // Custom "per-page" breakpoints.
            const ResponsiveBreakpoints(breakpoints: [
              Breakpoint(start: 0, end: 480, name: MOBILE),
              Breakpoint(start: 481, end: 1200, name: TABLET),
              Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
            ], child: PostPage()),
          TypographyPage.name => const TypographyPage(),
          _ => const SizedBox.shrink(),
        });
  }
}
