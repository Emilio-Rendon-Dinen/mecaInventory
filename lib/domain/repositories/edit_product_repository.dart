import 'package:meca_inventory/domain/entities/product.dart';

abstract class EditProductRepository {
  Future<void> editProduct({
    required Product product,
  });
}
