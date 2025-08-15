import 'package:meca_inventory/src/domain/entities/product.dart';

abstract class EditProductRepository {
  Future<Product> editProduct({
    required Product product,
  });
}
