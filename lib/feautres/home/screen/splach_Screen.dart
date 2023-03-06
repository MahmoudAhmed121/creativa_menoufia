import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), Navigatorr);
  }

  void Navigatorr() {
    Navigator.pushReplacementNamed(context, "first");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/animation/splach.json"),
      ),
    );
  }
}
