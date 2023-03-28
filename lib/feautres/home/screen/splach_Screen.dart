import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), Navigatorr);
  }

  void Navigatorr() async {
    final prefs = await SharedPreferences.getInstance();
    final access = await prefs.get("access_token");
    if (access == null) {
      Navigator.of(context).pushReplacementNamed("first");
    } else {
      Navigator.of(context).pushReplacementNamed("nav");
    }
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
