import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mahmoud/feautres/home/model/user_model.dart';
import 'package:mahmoud/feautres/home/repositories/user_repo.dart';
import 'package:mahmoud/feautres/home/screen/user_details.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(centerTitle: true,
      leading: SizedBox(),
      title: Text("UserPage"),
      backgroundColor: Color(0xfff8af43),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<Screen>>(
              future: AllUserRepository().fetchUserData(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Screen>> snapshot) {
                final listOfBanner = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemBuilder: ((context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xffEBF0FF))),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: Lottie.asset(
                                      "assets/animation/loading.json"),
                                )
                              ]),
                        ),
                      );
                    }),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listOfBanner!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
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
                                          id: listOfBanner[index].id,
                                          name: listOfBanner[index].name,
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
                                        border: Border.all(color: Color.fromARGB(255, 238, 185, 105)),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Image.network(
                                      listOfBanner[index].avatar,
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
                                        listOfBanner[index].name,
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
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
