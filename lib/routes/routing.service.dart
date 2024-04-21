// Module
import 'package:flutter/material.dart';

// Model
import '../models/routingModel.dart';

// Route
import 'app.routing.dart';

String mainPath = getMainRoute().path;
String errorPath = getErrorRoute().path;

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  final route = routes.firstWhere((r) => r.path == settings.name);
  return MaterialPageRoute(
    builder: (context) =>
        route.component(context, args as Map<String, dynamic>?),
    settings: settings,
  );
}

NewRoute getMainRoute() {
  return routes.firstWhere(
    (route) => route.isMainRoute,
  );
}

NewRoute getErrorRoute() {
  return routes.firstWhere(
    (route) => route.path == '/error',
  );
}

NewRoute findRouteByPath(String path) {
  return routes.firstWhere((route) => route.path == path);
}

NewRoute? findNextRouteFromCurrent(BuildContext context) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute != null) {
    int indexOfCurrentRoute =
        routes.indexWhere((route) => route.path == currentRoute);
    if (indexOfCurrentRoute < 0) {
      indexOfCurrentRoute = 0;
    } else if (indexOfCurrentRoute >= routes.length - 1) {
      return null;
    }
    return routes[indexOfCurrentRoute + 1];
  }
  return getMainRoute();
}

NewRoute? findPreviousRouteFromCurrent(BuildContext context) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute != null) {
    int indexOfCurrentRoute =
        routes.lastIndexWhere((route) => route.path == currentRoute);
    return indexOfCurrentRoute > 0 ? routes[indexOfCurrentRoute - 1] : null;
  }
  return null;
}
