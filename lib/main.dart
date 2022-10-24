import 'package:flutter/material.dart';
import 'package:nubank/pages/home.dart';

void main() {
  runApp(const MainRoutes());
}

class MainRoutes extends StatefulWidget {
  const MainRoutes({super.key});

  @override
  State<MainRoutes> createState() => _MainRoutesState();
}

class _MainRoutesState extends State<MainRoutes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
    );
  }
}
