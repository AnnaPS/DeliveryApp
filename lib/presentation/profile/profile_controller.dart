import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:deliveryApp/domain/repository/profile_api_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ProfileRepositoryInterface profileRepositoryInterface;

  ProfileController(
      this.localRepositoryInterface, this.profileRepositoryInterface);

  Rx<User> user = User.empty().obs;
  static ProfileController get controller => Get.find();
  RxBool darkTheme = false.obs;

  @override
  void onInit() {
    loadCurrentTheme();
    super.onInit();
  }

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then(
      (value) {
        user(value);
      },
    );
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await profileRepositoryInterface.logout(token);
    await localRepositoryInterface.clearAllData();
  }

  @override
  void onClose() {
    user.close();
    super.onClose();
  }

  void loadCurrentTheme() {
    localRepositoryInterface.isDarkMode().then(
      (value) {
        darkTheme(value);
      },
    );
  }

  bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;
  }
}
