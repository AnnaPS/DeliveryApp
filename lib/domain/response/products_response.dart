import 'package:deliveryApp/domain/model/userEntity.dart';

class ProductResponse {
  final String token;
  final User user;

  const ProductResponse(this.token, this.user);
}
