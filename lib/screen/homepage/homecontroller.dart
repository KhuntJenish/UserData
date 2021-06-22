import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/model/model.dart';
import 'package:github_user/network/network.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var isSearching = false;
  var userList = List<UserModel>().obs;
  var searchList = List<UserModel>().obs;
  var searchText = '';
  String page = '0';
  ScrollController scrollController = ScrollController();
  TextEditingController searchQuery = TextEditingController();

  @override
  void onInit() {
    fetchUsers();
    paginationTask();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      var users = await UserProvider().getUser(page);
      // var users = await ApiService.fetchUser();
      if (users != null) {
        userList.addAll(users);
      }
    } finally {
      isLoading(false);
    }
  }

  void paginationTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page = (userList.length > 0)
            ? userList[userList.length - 1].id.toString()
            : 0.toString();
        getMoreData(page);
      }
    });
  }

  Future<void> getMoreData(String page) async {
    try {
      // isLoading(true);
      var users = await UserProvider().getUser(page);
      // var users = await ApiService.fetchUser();
      if (users != null) {
        userList.addAll(users);
      }
    } finally {
      isLoading(false);
    }
  }

  void SearchListState() {
    searchQuery.addListener(
      () {
        if (searchQuery.text.isEmpty) {
          isSearching = false;
          searchText = "";
        } else {
          isSearching = true;
          searchText = searchQuery.text;
          print(searchText);
        }
        _buildSearchList();
      },
    );
  }

  List<UserModel> _buildSearchList() {
    if (searchText.isEmpty) {
      return userList.toList();
    } else {
      // searchList = [];
      for (int i = 0; i < userList.length; i++) {
        String name = userList[i].login;
        if (name.toLowerCase().contains(searchText.toLowerCase())) {
          searchList.add(userList[i]);
        }
      }
      return searchList.toList();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
  }
}
