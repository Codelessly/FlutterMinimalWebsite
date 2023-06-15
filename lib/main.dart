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
          // The following code implements the legacy ResponsiveWrapper AutoScale functionality
          // using the new ResponsiveScaledBox. The ResponsiveScaledBox widget preserves
          // the legacy ResponsiveWrapper behavior, scaling the UI instead of resizing.
          //
          // **MaxWidthBox** - A widget that limits the maximum width.
          // This is used to create a gutter area on either side of the content.
          //
          // **ResponsiveScaledBox** - A widget that  renders its child
          // with a FittedBox set to the `width` value. Set the fixed width value
          // based on the active breakpoint.
          return MaxWidthBox(
            maxWidth: 1200,
            background: Container(color: const Color(0xFFF5F5F5)),
            child: ResponsiveScaledBox(
              width: ResponsiveValue<double>(context, conditionalValues: [
                const Condition.equals(name: MOBILE, value: 450),
                const Condition.between(start: 800, end: 1100, value: 800),
                const Condition.between(start: 1000, end: 1200, value: 1000),
                // There are no conditions for width over 1200
                // because the `maxWidth` is set to 1200 via the MaxWidthBox.
              ]).value,
              child: BouncingScrollWrapper.builder(
                  context, buildPage(settings.name ?? ''),
                  dragWithMouse: true),
            ),
          );
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
