// manage bussiness logic
import 'package:deliveryApp/domain/repository/login_api_repository.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:deliveryApp/presentation/routes/delivery_navigation.dart';
import 'package:deliveryApp/presentation/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final LoginApiRepositoryInterface apiRepositoryInterface;

  SplashController(this.localRepositoryInterface, this.apiRepositoryInterface);

// El controller se ha creado pero la vista aun no se ha renderizado
  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }

// El controller se ha creado y la vista se ha renderizado
  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();

    if (token != null) {
      final user = await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.offNamed(DeliveryRoutes.login);
    }
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark != null) {
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    } else {
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }
  }
}
