import 'package:get/get.dart';
import 'package:github_user/model/user_model.dart';
import 'package:github_user/model/users_model.dart';

class UserProvider extends GetConnect {
  List<UsersModel> res = [];
  UserModel user_res;
  Future<List<UsersModel>> getUsers(String page) async {
    String url = "https://api.github.com/users?since=$page";
    final response = await get(url);
    if (response.status.hasError) {
      print('response.status.hasError');
      return Future.error(response.statusText);
    } else {
      var jsonbody = response.body as List;
      res = jsonbody.map((jsonbody) {
        final user = UsersModel.fromJson(jsonbody);
        return user;
      }).toList();

      return res;
    }
  }

  Future<UserModel> getUser(String url) async {
    print(url);
    final response = await get(url);
    if (response.status.hasError) {
      print('response.status.hasError');
      return Future.error(response.statusText);
    } else {
      var jsonbody = response.body;
      user_res = jsonbody.map((jsonbody) {
        final user = UserModel.fromJson(jsonbody);
        return user;
      }) as UserModel;

      return user_res;
    }
  }
}
