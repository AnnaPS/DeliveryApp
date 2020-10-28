import 'package:deliveryApp/domain/model/productsEntity.dart';

abstract class ProductRepositoryInterface {
  Future<List<Product>> getProducts();
}
