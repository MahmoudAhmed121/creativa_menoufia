import 'package:flutter/material.dart';
import 'package:mahmoud/feautres/home/model/user.dart';
import 'package:mahmoud/feautres/home/repositories/user_repo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      mainAxisExtent: 300,
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
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(
                                  child: CircularProgressIndicator(
                                    
                                  ),
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
                      mainAxisExtent: 300,
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
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    listOfBanner[index].avatar,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    listOfBanner[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("${listOfBanner[index].email}")
                                ]),
                          ),
                        ),
                      );
                    }),
                  );
                  
                }return SizedBox();
                  
              },
            ),
          ],
        ),
      ),
    );
  }
}
