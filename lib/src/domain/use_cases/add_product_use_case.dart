import 'package:meca_inventory/src/domain/entities/product.dart';
import 'package:meca_inventory/src/domain/repositories/add_products_repository.dart';

class AddProductUseCase {
  final AddProductsRepository _addProductsRepository;

  const AddProductUseCase(
    this._addProductsRepository,
  );

  Future<void> addProduct({
    required Product product,
  }) {
    try {
      return _addProductsRepository.addProduct(
        product: product,
      );
    } catch (e) {
      rethrow;
    }
  }
}
