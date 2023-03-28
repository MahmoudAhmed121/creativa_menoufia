import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mahmoud/feautres/home/cubit/cubit/home_cubit.dart';

import 'package:mahmoud/feautres/home/screen/user_details.dart';

class Home extends StatelessWidget {
  Home({super.key});
  bool? x;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDataFromApi(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: SizedBox(),
          title: Text("UserPage"),
          backgroundColor: Color(0xfff8af43),
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
          
        }, builder: (context, state) {
          
            
          if (state is HomeDone) {
            final data = state.userData;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.9,
                    ),
                    itemBuilder: ((context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xffEBF0FF))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserDetails(
                                          id: data[index].id,
                                          name: data[index].name,
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 238, 185, 105)),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Image.network(
                                      data[index].avatar,
                                      scale: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 80,
                                    margin: EdgeInsets.only(left: 2, right: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xfff8af43)),
                                    child: Center(
                                      child: Text(
                                        data[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          } else {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 220,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1 / 2.7,
              ),
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffEBF0FF),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Lottie.asset("assets/animation/loading.json"),
                        )
                      ],
                    ),
                  ),
                );
              }),
            );
          
          }
        }),
      ),
    );
  }
}
