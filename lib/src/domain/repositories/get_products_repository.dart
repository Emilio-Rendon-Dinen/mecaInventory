import 'package:meca_inventory/src/domain/entities/product.dart';

abstract class GetProductsRepository {
  Future<List<Product>> getProducts();
}
