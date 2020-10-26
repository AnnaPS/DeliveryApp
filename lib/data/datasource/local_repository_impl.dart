import 'package:deliveryApp/domain/model/userEntity.dart';
import 'package:deliveryApp/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_name = 'NAME';
const _pref_email = 'EMAIL';
const _pref_theme = 'THEME';
const _pref_image = 'IMAGE';

class LocalRepository extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }

  @override
  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final name = sharedPreferences.getString(_pref_name);
    final image = sharedPreferences.getString(_pref_image);
    final theme = sharedPreferences.getString(_pref_theme);
    final email = sharedPreferences.getString(_pref_email);

    final user = User(name: name, image: image, theme: theme, email: email);
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_name, user.name);
    sharedPreferences.setString(_pref_image, user.image);
    sharedPreferences.setString(_pref_theme, user.theme);
    sharedPreferences.setString(_pref_email, user.email);
    return user;
  }
}
