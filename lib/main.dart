import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahmoud/feautres/home/cubit/cubit/home_cubit.dart';
import 'package:mahmoud/feautres/home/screen/first_regis.dart';
import 'package:mahmoud/feautres/home/screen/home.dart';
import 'package:mahmoud/feautres/home/screen/login.dart';
import 'package:mahmoud/feautres/home/screen/splach_Screen.dart';
import 'package:mahmoud/vav_bar.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  TextEditingController x = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splach",
      routes: {
        "splach": (context) => Splach(),
        "first": (context) => FirstRegister(),
        "tabBar": (context) => TabBarDemo(initialIndex: 1,),
        "nav": (context) => NavBar(emailControlers: x,),
        "home": (context) => Home(),
      

      },
    );
  }
}
