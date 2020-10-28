import 'package:deliveryApp/domain/model/productsEntity.dart';
import 'package:deliveryApp/domain/repository/product_api_repository.dart';
import 'in_memory_products.dart';

class ProductRepositoryImpl extends ProductRepositoryInterface {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return products;
  }
}
