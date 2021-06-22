import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/commanmodules/commanmodule.dart';
import 'package:github_user/commanmodules/drawer.dart';
import 'package:github_user/screen/homepage/homecontroller.dart';
import 'package:github_user/screen/userpage/userpage.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            leading: IconButton(
                                icon: Icon(Icons.format_align_justify),
                                onPressed: () {
                                  _scaffoldKey.currentState.openDrawer();
                                }),
                            title: Text('hello'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Obx(
                  () {
                    if (homeController.isLoading.value) {
                      return circlularProgressIndicator();
                    } else {
                      return ListView.builder(
                        controller: homeController.scrollController,
                        itemCount: homeController.userList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == homeController.userList.length) {
                            return circlularProgressIndicator();
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    UserPage(),
                                    transition: Transition.zoom,
                                    arguments: homeController.userList[index],
                                  );
                                },
                                child: Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(homeController
                                              .isSearching
                                          ? '${homeController.searchList[index].avatarUrl}'
                                          : '${homeController.userList[index].avatarUrl}'),
                                    ),
                                    title: Text(
                                      homeController.isSearching
                                          ? '${homeController.searchList[index].login}'
                                          : '${homeController.userList[index].login}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      homeController.isSearching
                                          ? 'ID : ${homeController.searchList[index].id}'
                                          : 'ID : ${homeController.userList[index].id}',
                                      // style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(Icons.star),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
