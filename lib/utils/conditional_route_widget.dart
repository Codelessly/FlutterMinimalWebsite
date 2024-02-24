import 'package:flutter/material.dart';

class ConditionalRouteWidget extends StatelessWidget {
  final List<String>? routes;
  final List<String>? routesExcluded;
  final TransitionBuilder builder;
  final Widget child;

  const ConditionalRouteWidget(
      {super.key,
      this.routes,
      this.routesExcluded,
      required this.builder,
      required this.child})
      : assert(routes == null || routesExcluded == null,
            'Cannot include `routes` and `routesExcluded`. Please provide an list of routes to include or exclude, not both.');

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (routes != null && routes!.contains(currentRoute)) {
      return builder(context, child);
    } else if (routesExcluded != null &&
        routesExcluded!.contains(currentRoute) == false) {
      return builder(context, child);
    }

    return child;
  }
}
