import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/model/login_request_entity.dart';
import 'package:deliveryApp/domain/repository/login_api_repository.dart';
import 'package:deliveryApp/domain/response/login_response.dart';

class LoginApiRepositoryImpl extends LoginApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 3));
    if (token == 'AA111') {
      return User(
          name: 'Leonardo',
          email: 'leoanardo@gmail.com',
          image: 'assets/img/leo.png');
    } else if (token == 'AA222') {
      return User(
          name: 'Donatello',
          email: 'donatello@gmail.com',
          image: 'assets/img/donatello.png');
    }

    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequestEntity login) async {
    await Future.delayed(const Duration(seconds: 3));

    if (login.userName == 'leonardo' && login.password == '1234') {
      return LoginResponse(
          'AA111',
          User(
              name: 'leonardo',
              email: 'leoanardo@gmail.com',
              image: 'assets/img/leo.png'));
    } else if (login.userName == 'donatello' && login.password == '1234') {
      return LoginResponse(
          'AA222',
          User(
              name: 'donatello',
              email: 'donatello@gmail.com',
              image: 'assets/img/donatello.png'));
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('removing token from server');
  }
}

class AuthException {}
