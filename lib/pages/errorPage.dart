// Module
import 'package:flutter/material.dart';

// Component
import '../components/navbar.component.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar(context),
      body: Image.asset(
        "assets/images/errorpage/Error404.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
