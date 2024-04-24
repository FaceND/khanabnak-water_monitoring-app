// Module
import 'package:flutter/material.dart';

// // Model
import '../models/navbar.model.dart';

// Route
import '../routes/routing.service.dart';

// Navbar
import 'navbar.app.dart';

void mainNavigateTo(BuildContext context, String route) {
  try {
    Navigate selectedNav = navbars.firstWhere((nav) => nav.title == route);
    String selectedRoute = selectedNav.route;
    if (ModalRoute.of(context)!.settings.name == selectedRoute) {
      Navigator.pushReplacementNamed(context, selectedRoute);
    } else {
      Navigator.pushNamed(context, selectedRoute);
    }
  } catch (e) {
    // Handle the case when the selected route is not found
    Navigator.pushNamed(context, errorPath);
  }
}

void navigateTo(BuildContext context, String route) {
  try {
    Navigate selectedNav = navbars.firstWhere((nav) => nav.title == route);
    String selectedRoute = selectedNav.route;
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute == selectedRoute) {
      Navigator.pushReplacementNamed(context, selectedRoute);
    } else if (mainPath == selectedRoute) {
      Navigator.of(context).popUntil((route) => route.settings.name == '/');
      Navigator.pushNamed(context, selectedRoute);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, selectedRoute, ModalRoute.withName(mainPath));
    }
  } catch (e) {
    // Handle the case when the selected route is not found
    Navigator.pushNamed(context, errorPath);
  }
}

void navigateToMain(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.settings.name == '/');
  try {
    Navigator.pushNamed(context, mainPath);
  } catch (e) {
    // Handle the case when the selected route is not found
    Navigator.pushNamed(context, errorPath);
  }
}
