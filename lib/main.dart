// Module
import 'package:flutter/material.dart';

// // Page
import 'pages/welcomePage.dart';

// Service
import 'services/storageService.dart';

// Routing
import 'routes/routing.service.dart';

void main() async {
  await clearStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomePage(),
      onGenerateRoute: (settings) {
        try {
          return generateRoute(settings);
        } catch (_) {
          return MaterialPageRoute(
            builder: (context) => getErrorRoute().component(context, null),
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
