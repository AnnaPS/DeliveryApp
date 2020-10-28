import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;

  HomeController(this.localRepositoryInterface);
  Rx<User> user = User.empty().obs;
  RxInt indexSelected = 0.obs;

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

  void updateIndexSelected(int index) {
    indexSelected.value = index;
  }
}
