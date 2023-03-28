import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'get_controller.dart';

class TabBarDemo extends StatefulWidget {
  TabBarDemo({super.key, required this.initialIndex});

  final initialIndex;

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _keyTwo = GlobalKey();

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordControllerOne = TextEditingController();
  TextEditingController emailControlerOne = TextEditingController();
  TextEditingController test = TextEditingController();
  TextEditingController passwordControllerTwo = TextEditingController();
  TextEditingController emailControlerTwo = TextEditingController();

  bool obscureTextOne = true;
  bool obscureTextTwo = true;
  bool obscureTextThere = true;

  bool colorone = false;
  bool colorTwo = false;
  var c = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialIndex,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Container(
            height: 8.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Color(0xffD2D4D8),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          elevation: 0.0,
          toolbarHeight: 50,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Color(0xfff8af43),
            labelColor: Color(0xfff8af43),
            unselectedLabelColor: Color(0xff89909E),
            tabs: [
              Tab(child: Text('Create Account')),
              Tab(child: Text('Login')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: const [
                            Text(
                              'Full Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.length <= 6) {
                              return 'Please Enter Your Name Again';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: const [
                            Text(
                              'Your Number',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == 11) {
                              return "Please Enter Your Phone Agin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          children: const [
                            Text(
                              'Email Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: TextFormField(
                          controller: emailControlerOne,
                          validator: (value1) {
                            if (value1!.isEmpty) {
                              return 'Please Enter Email Again';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'https://creativa.app',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: TextFormField(
                          controller: test,
                          obscureText: obscureTextOne,
                          validator: (value2) {
                            if (value2!.length <= 5) {
                              return ' Oops! Your Password Is Not Correct ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureTextOne = !obscureTextOne;
                                  });
                                },
                                icon: obscureTextOne
                                    ? Icon(
                                        Icons.visibility_off,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                      ),
                              ),
                              labelText: '**** **** ****',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: TextFormField(
                          controller: passwordControllerOne,
                          obscureText: obscureTextOne,
                          validator: (value2) {
                            if (value2!.length <= 5) {
                              return ' Oops! Your Password Is Not Correct ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureTextThere = !obscureTextOne;
                                  });
                                },
                                icon: obscureTextOne
                                    ? Icon(
                                        Icons.visibility_off,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                      ),
                              ),
                              labelText: '**** **** ****',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                colorone = !colorone;
                                colorTwo = !colorTwo;
                              });
                            },
                            icon: Icon(
                              Icons.male_outlined,
                              color: colorone ? Colors.blue : Colors.grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                colorTwo = !colorTwo;
                                colorone = !colorTwo;
                              });
                            },
                            icon: Icon(
                              Icons.female,
                              color: colorTwo ? Colors.pink : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF4F4F4),
                        ),
                        width: 220,
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              c.sendData(nameController.text,
                                  emailControlerOne.text, phoneController.text);
                              signIn();
                            } else if (passwordControllerOne == test) {
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(" Password does not match"),
                                backgroundColor: Color(0xfff8af43),
                              ));
                            }
                          },
                          child: const Text(
                            'Registration',
                            style: TextStyle(
                                color: Color(0xff9CA3AF), fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120, right: 120),
                        child: Divider(height: 25),
                      ),
                      Container(
                        height: 55,
                        margin: EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffF4F4F4),
                        ),
                        width: 220,
                        //
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/ic_google.png'),
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign up with Google',
                                style: TextStyle(
                                    color: Color(0xff222222), fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),

            // regis/////

            Form(
              key: _keyTwo,
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Email Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          controller: emailControlerTwo,
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 7) {
                              return "Your Email is not Correct";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'https://creativa.app',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: const [
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          controller: passwordControllerTwo,
                          obscureText: obscureTextTwo,
                          validator: (value) {
                            if (value!.length < 7) {
                              return "Password is wrong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureTextTwo = !obscureTextTwo;
                                  });
                                },
                                icon: obscureTextTwo
                                    ? Icon(
                                        Icons.visibility_off,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                      ),
                              ),
                              labelText: '*** *** ***',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF4F4F4),
                        ),
                        width: 220,
                        child: MaterialButton(
                          onPressed: () {
                            if (_keyTwo.currentState!.validate()) {
                              Login();
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xff9CA3AF), fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 90, right: 90),
                        child: const Divider(height: 25),
                      ),
                      Container(
                        height: 55,
                        margin: const EdgeInsets.only(left: 50, right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffF4F4F4),
                        ),
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/ic_google.png'),
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                'Login with Google',
                                style: TextStyle(
                                    color: Color(0xff222222), fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signIn() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameController.text,
        "email": emailControlerOne.text,
        "password": passwordControllerOne.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });

      c.sendData(nameController.text, emailControlerOne.text,
          passwordControllerOne.text);

      Navigator.pushReplacementNamed(context, "tabBar");
    } on DioError catch (x) {
      if (x.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("You should enter Valid email and password"),
        ));
      }
    }
  }

  void Login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": emailControlerTwo.text,
        "password": passwordControllerTwo.text,
      });

      final accessToken = response.data["access_token"];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("access_token", accessToken);
      final access = await prefs.get(accessToken);
      print("my access Token is : $access");
      Navigator.of(context).pushReplacementNamed("nav");
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 401) {
        print("my response is: ${e.response}");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("The email or password is incorrect"),
          backgroundColor: Color(0xfff8af43),
        ));
      }
    }
  }
}
