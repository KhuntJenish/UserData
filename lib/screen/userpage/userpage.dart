import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('${Get.arguments.avatarUrl}'),
                    radius: 70,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'User name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'followers',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'following',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${Get.arguments.login}',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '${Get.arguments.following}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '${Get.arguments.followers}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
