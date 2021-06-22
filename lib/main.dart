import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/screen/homepage/homebinding.dart';
import 'package:github_user/screen/homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      initialRoute: "/Home",
      getPages: [
        GetPage(name: "/Home", page: () => HomePage(), binding: HomeBinding()),
        // GetPage(name: "/Profile", page: () => ProfilePage()),
      ],
    );
  }
}
