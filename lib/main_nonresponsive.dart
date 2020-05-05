import 'package:flutter/material.dart';
import 'package:minimal/pages/pages.dart';
import 'package:minimal/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.home:
            return Routes.fadeThrough(settings, (context) => ListPage());
            break;
          case Routes.post:
            return Routes.fadeThrough(settings, (context) => PostPage());
            break;
          case Routes.style:
            return Routes.fadeThrough(settings, (context) => TypographyPage());
            break;
          default:
            return null;
            break;
        }
      },
      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
    );
  }
}
