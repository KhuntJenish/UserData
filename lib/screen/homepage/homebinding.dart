import 'package:get/get.dart';
import 'package:github_user/screen/homepage/homecontroller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersController>(
      () => UsersController(),
    );
  }
}
