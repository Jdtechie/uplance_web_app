import 'package:flutter/material.dart';
import 'package:uplance_flutter_web/pages/landing_page/main_landing_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainLandingPage(),
      // TrustAndSafetySection(),
      // LandingPage(),
      //  MainPage(),
    );
  }
}
