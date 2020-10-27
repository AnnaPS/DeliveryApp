import 'package:deliveryApp/domain/model/userEntity.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<String> saveToken(String token);
  Future<void> clearAllData();
  Future<User> saveUser(User user);
  Future<User> getUser();
  Future<void> saveDarkMode(bool darkMode);
  Future<bool> isDarkMode();
}
