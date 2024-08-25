import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static Route<T> fadeThrough<T>(
      {required RouteSettings settings,
      required WidgetBuilder builder,
      int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }

  static Route<T> noAnimation<T>(
      {required RouteSettings settings, required WidgetBuilder builder}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
