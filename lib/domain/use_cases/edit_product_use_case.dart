import 'package:meca_inventory/domain/entities/product.dart';
import 'package:meca_inventory/domain/repositories/edit_product_repository.dart';

class EditProductUseCase {
  final EditProductRepository _editProductRepository;
  const EditProductUseCase(this._editProductRepository);

  Future<void> editProduct({
    required Product product,
  }) {
    try {
      return _editProductRepository.editProduct(
        product: product,
      );
    } catch (e) {
      rethrow;
    }
  }
}
