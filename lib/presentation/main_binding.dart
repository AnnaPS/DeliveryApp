import 'package:deliveryApp/data/datasource/login_api_repository_impl.dart';
import 'package:deliveryApp/data/datasource/local_repository_impl.dart';
import 'package:deliveryApp/domain/repository/login_api_repository.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
  }
}
