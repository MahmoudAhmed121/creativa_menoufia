import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mahmoud/feautres/home/model/user_model.dart';
import 'package:mahmoud/feautres/home/repositories/user_repo.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key, required this.id, required this.name});
  int id;
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff8af43),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(name),
      ),
      body: Column(children: [
        FutureBuilder<Screen>(
            future: AllUserRepository().fetchSingleUser(id),
            builder: (BuildContext context, AsyncSnapshot<Screen> snapshot) {
              final data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset("assets/animation/loading.json"));
              }
              return Column(
                children: [
                  Container(
                    child: Image.network(
                      "${data!.avatar}",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text(
                              "name: ${data.name}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe25225)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text("role: ${data.role}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe25225))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text(
                              "email: ${data.email}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe25225)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text(
                              "password: ${data.password}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe25225)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text(
                              "creation at: ${data.creationAt}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe25225)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: double.infinity,
                            color: Color(0xfffbe4d4),
                            child: Text(
                              "update at: ${data.updatedAt}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffe25225),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ]),
    );
  }
}
