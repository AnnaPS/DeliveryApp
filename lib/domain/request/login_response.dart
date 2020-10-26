import 'package:deliveryApp/domain/model/userEntity.dart';

class LoginResponse {
  final String token;
  final User user;

  const LoginResponse(this.token, this.user);
}
