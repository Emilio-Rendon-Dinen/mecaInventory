import 'package:meca_inventory/domain/entities/product.dart';

abstract class EditProductRepository {
  Future<Product> editProduct({
    required Product product,
  });
}
