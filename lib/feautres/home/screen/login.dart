import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  TabBarDemo({super.key, required this.initialIndex});

  final initialIndex;

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _keyTwo = GlobalKey();

  bool obscureTextOne = true;
  bool obscureTextTwo = true;
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
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.only(left: 16),
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
                        margin: EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length <= 8) {
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
                      const SizedBox(height: 25),
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
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: TextFormField(
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
                      const SizedBox(height: 20),
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
                              Navigator.pushReplacementNamed(context, "home");
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
                    ],
                  ),
                ),
              ),
            ),

            //
            Form(
              key: _keyTwo,
              child: Container(
                color: Colors.white,
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
                            Navigator.pushReplacementNamed(context, "home");
                          }
                        },
                        child: Text(
                          'Login',
                          style:
                              TextStyle(color: Color(0xff9CA3AF), fontSize: 20),
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
          ],
        ),
      ),
    );
  }
}
