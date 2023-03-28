import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:mahmoud/feautres/acount/screen/acount.dart';
import 'package:mahmoud/feautres/acount/screen/history.dart';
import 'package:mahmoud/feautres/home/screen/home.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
  NavBar({required this.emailControlers});
  final TextEditingController emailControlers;
}

class _NavBarState extends State<NavBar> {
  bool isInternt = false;


 

  late List listOfScreens;

  @override
  void initState() {
    super.initState();

    listOfScreens = [
      Home(),
      AccountPage(),
      CameraPage(),
      
    ];

    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isInternt = false;
        });
      } else {
        setState(() {
          isInternt = true;
        });
      }
    });
  }

  int currentIndex = 0;

  Widget build(BuildContext context) {
    if (isInternt == false) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animation/internet.json",
                height: 400,
                width: 400,
              ),
            ],
          )),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Color(0xfff8af43),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GNav(
            backgroundColor: Color(0xfff8af43),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(
              0xfff8af43,
            ),
            gap: 8,
            padding: EdgeInsets.all(10),
            onTabChange: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.person_3_rounded,
                text: "profile",
              ),
              GButton(
                icon: Icons.settings,
                text: "setting",
              )
            ],
          ),
        ),
      ),
      body: listOfScreens[currentIndex],
    );
  }
}
