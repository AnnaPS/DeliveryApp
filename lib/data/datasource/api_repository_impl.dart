import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/model/login_request_entity.dart';
import 'package:deliveryApp/domain/repository/api_repository.dart';
import 'package:deliveryApp/domain/request/login_response.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
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

    if (login.email == 'leoanardo@gmail.com') {
      return LoginResponse(
          'AA111',
          User(
              name: 'Leonardo',
              email: 'leoanardo@gmail.com',
              image: 'assets/img/leo.png'));
    } else if (login.email == 'donatello@gmail.com') {
      return LoginResponse(
          'AA222',
          User(
              name: 'Donatello',
              email: 'donatello@gmail.com',
              image: 'assets/img/donatello.png'));
    }

    throw AuthException();
  }

  @override
  Future<void> logout(String token) {
    print('removing token from server');
  }
}

class AuthException {}
