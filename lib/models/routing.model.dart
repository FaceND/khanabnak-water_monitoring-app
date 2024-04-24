// Module
import 'package:flutter/material.dart';

class NewRoute {
  final String path;
  final Widget Function(BuildContext?, Map<String, dynamic>?) component;
  final bool isMainRoute;

  NewRoute({
    required this.path,
    required this.component,
    this.isMainRoute = false,
  });
}


