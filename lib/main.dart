import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/routes.dart';
import 'package:navigation_utils/navigation_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        return Routes.fadeThrough(settings, (context) {
          return ConditionalRouteWidget(
              routesExcluded: const [],
              builder: (context, child) => MaxWidthBox(
                    maxWidth: 1200,
                    background: Container(color: const Color(0xFFF5F5F5)),
                    child: ResponsiveScaledBox(
                        width: ResponsiveValue<double>(context,
                            conditionalValues: [
                              const Condition.equals(name: MOBILE, value: 450),
                              const Condition.between(
                                  start: 800, end: 1100, value: 800),
                              const Condition.between(
                                  start: 1000, end: 1200, value: 1000),
                            ]).value,
                        child: child!),
                  ),
              child: BouncingScrollWrapper.builder(
                  context, buildPage(settings.name ?? '')));
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildPage(String name) {
    switch (name) {
      case '/':
      case ListPage.name:
        return const ListPage();
      case PostPage.name:
        return const PostPage();
      case TypographyPage.name:
        return const TypographyPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
