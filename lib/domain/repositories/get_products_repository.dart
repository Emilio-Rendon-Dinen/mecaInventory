import 'package:meca_inventory/domain/entities/product.dart';

abstract class GetProductsRepository {
  Future<List<Product>> getProducts();
}
