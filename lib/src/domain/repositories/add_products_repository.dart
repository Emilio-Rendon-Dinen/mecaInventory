import 'package:meca_inventory/src/domain/entities/product.dart';

abstract class AddProductsRepository {
  Future<void> addProduct({
    required Product product,
  });
}
