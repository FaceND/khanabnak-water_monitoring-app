// Module
import 'package:flutter/material.dart';

// Page
import 'page/welcomePage.dart';
import 'page/detailPage.dart';
import 'page/aboutusPage.dart';
import 'page/manualPage.dart';

// Service
import '../service/storageService.dart';

void main() async {
  await clearStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome', // Set the initial route to the welcome page
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/detail': (context) => const DetailPage(),
        '/aboutus': (context) => const AboutusPage(),
        '/manual': (context) => const ManualPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
