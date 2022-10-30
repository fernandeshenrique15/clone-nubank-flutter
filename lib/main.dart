import 'package:flutter/material.dart';
import 'package:nubank/pages/account.dart';
import 'package:nubank/pages/desenvolvimento.dart';
import 'package:nubank/pages/home.dart';
import 'package:nubank/pages/pay.dart';

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
        '/account': (context) => const Account(),
        '/pay': (context) => const Pay(),
        '/criar': (context) => const Desenvolvimento(),
      },
    );
  }
}
