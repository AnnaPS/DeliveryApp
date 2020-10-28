import 'package:deliveryApp/domain/repository/profile_api_repository.dart';

class ProfileRepositoryImpl extends ProfileRepositoryInterface {
  @override
  Future<void> logout(String token) async {
    print('removing token from server $token');
  }
}
