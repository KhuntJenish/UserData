import 'package:get/get.dart';
import 'package:github_user/model/model.dart';

class UserProvider extends GetConnect {
  List<UserModel> res = [];
  Future<List<UserModel>> getUser(String page) async {
    String url = "https://api.github.com/users?since=$page";
    final response = await get(url);
    if (response.status.hasError) {
      print('response.status.hasError');
      return Future.error(response.statusText);
    } else {
      var jsonbody = response.body as List;
      res = jsonbody.map((jsonbody) {
        final user = UserModel.fromJson(jsonbody);
        return user;
      }).toList();

      return res;
    }
  }
}
