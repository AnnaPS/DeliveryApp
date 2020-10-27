import 'package:deliveryApp/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(Get.find(), Get.find()),
    );
  }
}
