import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/utils/no_animation_page_transitions_builder.dart';
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
      onGenerateInitialRoutes: (initialRoute) {
        final Uri uri = Uri.parse(initialRoute);
        return [
          buildPage(path: uri.path, queryParams: uri.queryParameters),
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        final Uri uri = Uri.parse(settings.name ?? '/');
        return buildPage(path: uri.path, queryParams: uri.queryParameters);
      },
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.fuchsia: NoAnimationPageTransitionsBuilder(),
            TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
            TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
            TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  // onGenerateRoute route switcher.
  // Navigate using the page name, `Navigator.pushNamed(context, ListPage.name)`.
  Route<dynamic> buildPage(
      {required String path, Map<String, String> queryParams = const {}}) {
    return PageRouteBuilder(
      settings: RouteSettings(
          name: (path.startsWith('/') == false) ? '/$path' : path),
      pageBuilder: (context, animation, secondaryAnimation) {
        String pathName =
            path != '/' && path.startsWith('/') ? path.substring(1) : path;
        return switch (pathName) {
          '/' || ListPage.name => const ListPage(),
          PostPage.name =>
            // Breakpoints can be nested.
            // Here's an example of custom "per-page" breakpoints.
            const ResponsiveBreakpoints(breakpoints: [
              Breakpoint(start: 0, end: 480, name: MOBILE),
              Breakpoint(start: 481, end: 1200, name: TABLET),
              Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
            ], child: PostPage()),
          TypographyPage.name => const TypographyPage(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
