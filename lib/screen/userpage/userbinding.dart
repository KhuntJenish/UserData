import 'package:get/get.dart';
import 'package:github_user/screen/userpage/usercontroller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
