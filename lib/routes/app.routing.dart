// Page
import '../pages/welcomePage.dart';
import '../pages/stationPage.dart';
import '../pages/aboutusPage.dart';
import '../pages/listManualPage.dart';
import '../pages/manualPage.dart';
import '../pages/errorPage.dart';

// Model
import '../models/routingModel.dart';
import '../models/manualModel.dart';

final List<NewRoute> routes = [
  NewRoute(
    path: "/welcome",
    component: (context, arguments) => const WelcomePage(),
  ),
  NewRoute(
    path: "/station",
    component: (context, arguments) => const StationPage(),
    isMainRoute: true,
  ),
  NewRoute(
    path: "/about-us",
    component: (context, arguments) => const AboutusPage(),
  ),
  NewRoute(
    path: "/list-manual",
    component: (context, arguments) => const ListManualPage(),
  ),
  NewRoute(
    path: "/manual",
    component: (context, arguments) => ManualPage(
      manualData: arguments?['manualData'] as Manual,
    ),
  ),
  NewRoute(
    path: "/error",
    component: (context, arguments) => const ErrorPage(),
  ),
];
