import 'package:meca_inventory/domain/repositories/add_products_repository.dart';

class AddProductUseCase {
  final AddProductsRepository _addProductsRepository;

  const AddProductUseCase(
    this._addProductsRepository,
  );

  Future<void> addProduct(String name, String description, int categoryId) {
    try {
      return _addProductsRepository.addProduct(
        name,
        description,
        categoryId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
