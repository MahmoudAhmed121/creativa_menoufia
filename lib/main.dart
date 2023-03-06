import 'package:flutter/material.dart';
import 'package:mahmoud/feautres/home/screen/first_regis.dart';
import 'package:mahmoud/feautres/home/screen/home.dart';
import 'package:mahmoud/feautres/home/screen/login.dart';
import 'package:mahmoud/feautres/home/screen/splach_Screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splach",
      routes: {

        "splach":(context) => Splach(),
        "first":(context) => FirstRegister(),
        "login": (context) => TabBarDemo(initialIndex: 1,),
        "home": (context) => Home(),
      },
    );
  }
}