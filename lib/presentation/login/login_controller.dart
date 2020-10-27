import 'package:deliveryApp/data/datasource/login_api_repository_impl.dart';
import 'package:deliveryApp/domain/model/login_request_entity.dart';
import 'package:deliveryApp/domain/repository/login_api_repository.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum LoginState { LOADING, INITIAL }

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController(this.localRepositoryInterface, this.apiRepositoryInterface);

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.INITIAL.obs;

  Future<bool> login() async {
    final userName = userNameTextController.text;
    final pass = passwordTextController.text;

    try {
      loginState(LoginState.LOADING);
      final loginResponse = await apiRepositoryInterface
          .login(LoginRequestEntity(userName: userName, password: pass));

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);

      return true;
    } on AuthException catch (_) {
      loginState(LoginState.INITIAL);
      return false;
    }
  }
}
