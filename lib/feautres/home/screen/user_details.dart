import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mahmoud/feautres/home/cubit/cubit/home_cubit.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key, required this.id, required this.name});
  int id;
  String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSingleUser(id),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
           
            if (state is HomeDetails) {
              final singeUser = state.userSingleData;
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
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "${singeUser.avatar}",
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
                                  "name: ${singeUser.name}",
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
                                child: Text("role: ${singeUser.role}",
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
                                  "email: ${singeUser.email}",
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
                                  "password: ${singeUser.password}",
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
                                  "creation at: ${singeUser.creationAt}",
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
                                  "update at: ${singeUser.updatedAt}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe25225),
                                  ),
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
            } else {
               return Scaffold(
                body: Center(
                  child: Lottie.asset("assets/animation/loading.json"),
                ),
              );
            }
          }),
    );
  }
}
