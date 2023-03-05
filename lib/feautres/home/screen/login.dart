import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                child: Stack(
                  children: [
                    Container(
                  
                      child: Lottie.asset(
                        "assets/animation/background.json",
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 260,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.length < 8) {
                                return "Your Email Is small";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xff9098B1),
                              ),
                              hintText: "Your Email",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Color(0xff9098B1)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: obscureText,
                            validator: (text) {
                              if (text!.length < 8) {
                                return "Your Email Is small";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Color(0xff9098B1),
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Color(0xff9098B1),
                                      ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff9098B1),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xff9098B1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xfff8af43),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacementNamed(
                                      context, "home");
                                }
                              });
                            },
                            child: SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width * .3,
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Image.asset("assets/images/Logo2.png"),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
