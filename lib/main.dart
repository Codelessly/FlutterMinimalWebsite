import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/routes.dart';
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
        child: BouncingScrollWrapper.builder(context, child!),
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
          switch (settings.name) {
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
        });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
