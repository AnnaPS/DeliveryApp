import 'package:deliveryApp/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(Get.find(), Get.find()),
    );
  }
}
