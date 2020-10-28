import 'package:deliveryApp/data/datasource/login_api_repository_impl.dart';
import 'package:deliveryApp/data/datasource/local_repository_impl.dart';
import 'package:deliveryApp/data/datasource/product_api_repository_impl.dart';
import 'package:deliveryApp/data/datasource/profile_api_repository_impl.dart';
import 'package:deliveryApp/domain/repository/login_api_repository.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:deliveryApp/domain/repository/product_api_repository.dart';
import 'package:deliveryApp/domain/repository/profile_api_repository.dart';
import 'package:deliveryApp/presentation/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<LoginApiRepositoryInterface>(() => LoginApiRepositoryImpl());
    Get.lazyPut<ProductRepositoryInterface>(() => ProductRepositoryImpl());
    Get.lazyPut<ProfileRepositoryInterface>(() => ProfileRepositoryImpl());
    Get.put(ProfileController(Get.find(), Get.find()));
  }
}
