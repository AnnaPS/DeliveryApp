import 'package:deliveryApp/domain/model/login_request_entity.dart';
import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/request/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequestEntity login);
  Future<void> logout(String token);
}
