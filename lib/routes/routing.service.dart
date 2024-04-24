// Module
import 'package:flutter/material.dart';

// Model
import '../models/routing.model.dart';

// Route
import 'routing.app.dart';

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
