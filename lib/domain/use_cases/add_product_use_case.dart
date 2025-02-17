import 'package:meca_inventory/domain/repositories/add_products_repository.dart';

class AddProductUseCase {
  final AddProductsRepository _addProductsRepository;

  const AddProductUseCase(
    this._addProductsRepository,
  );

  Future<void> addProduct({
    required String name,
    String? description,
    required int categoryId,
    String? cost,
  }) {
    try {
      return _addProductsRepository.addProduct(
        name: name,
        description: description,
        categoryId: categoryId,
        cost: cost,
      );
    } catch (e) {
      rethrow;
    }
  }
}
