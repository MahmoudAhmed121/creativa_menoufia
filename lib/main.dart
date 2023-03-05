import 'package:flutter/material.dart';
import 'package:mahmoud/feautres/home/screen/home.dart';
import 'package:mahmoud/feautres/home/screen/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login": (context) => Login(),
        "home": (context) => Home(),
      },
    );
  }
}
