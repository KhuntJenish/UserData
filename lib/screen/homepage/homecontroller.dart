import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/model/users_model.dart';
import 'package:github_user/network/network.dart';

class UsersController extends GetxController {
  var isLoading = false.obs;
  var isSearching = false;
  var usersList = List<UsersModel>().obs;
  var searchList = List<UsersModel>().obs;
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
      var users = await UserProvider().getUsers(page);
      // var users = await ApiService.fetchUser();
      if (users != null) {
        usersList.addAll(users);
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
        page = (usersList.length > 0)
            ? usersList[usersList.length - 1].id.toString()
            : 0.toString();
        getMoreData(page);
      }
    });
  }

  Future<void> getMoreData(String page) async {
    try {
      // isLoading(true);
      var users = await UserProvider().getUsers(page);
      // var users = await ApiService.fetchUser();
      if (users != null) {
        usersList.addAll(users);
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

  List<UsersModel> _buildSearchList() {
    if (searchText.isEmpty) {
      return usersList.toList();
    } else {
      // searchList = [];
      for (int i = 0; i < usersList.length; i++) {
        String name = usersList[i].login;
        if (name.toLowerCase().contains(searchText.toLowerCase())) {
          searchList.add(usersList[i]);
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
