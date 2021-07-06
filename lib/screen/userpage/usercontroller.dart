import 'package:get/get.dart';
import 'package:github_user/model/user_model.dart';
import 'package:github_user/model/users_model.dart';
import 'package:github_user/network/network.dart';
import 'package:github_user/screen/homepage/homecontroller.dart';

class UserController extends GetxController {
  UsersController _usersController = Get.find<UsersController>();
  var isLoading = false.obs;
  // var userList = List<UserModel>().obs;
  UserModel user;

  @override
  void onInit() {
    // TODO: implement onInit
    print(_usersController.usersList[0].url);
    fetchUser(_usersController.usersList[0].url);
    super.onInit();
  }

  Future<void> fetchUser(String url) async {
    print("URL : $url");
    try {
      isLoading(true);
      var user = await UserProvider().getUser(url);
      // var users = await ApiService.fetchUser();
      if (user != null) {
        // userList.addAll(user);
        // print(userList);
        return user;
      }
    } finally {
      isLoading(false);
    }
  }
}
