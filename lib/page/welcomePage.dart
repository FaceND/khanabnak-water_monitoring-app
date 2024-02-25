// Module
import 'package:flutter/material.dart';
import 'dart:ui';

// Date
import 'package:khanabnak_water/data/dropdownNav.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.30),
              BlendMode.darken,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/welcomepage/bg_welcome.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/icons/sci_Ciclelogo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 80),
                const Text(
                  'ระบบเฝ้าระวังคุณภาพน้ำ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Kanit'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ขนาบนาก อำเภอปากพนัง',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Kanit'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  // onPressed: () {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     PageRouteBuilder(
                  //       pageBuilder: (context, animation1, animation2) =>
                  //           const DetailPage(),
                  //       transitionsBuilder:
                  //           (context, animation1, animation2, child) {
                  //         return FadeTransition(
                  //             opacity: animation1, child: child);
                  //       },
                  //       transitionDuration: const Duration(milliseconds: 725),
                  //     ),
                  //   );
                  // },
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, mainRounte);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 240, 73, 148)),
                  ),
                  child: const Text(
                    'ยินดีต้อนรับ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
