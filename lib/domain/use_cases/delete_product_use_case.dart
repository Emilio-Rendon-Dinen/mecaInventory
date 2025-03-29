import 'package:meca_inventory/domain/repositories/delete_products_repository.dart';

class DeleteProductUseCase {
  final DeleteProductsRepository _deleteProductsRepository;

  const DeleteProductUseCase(this._deleteProductsRepository);

  Future<void> deleteProduct({
    required int productId,
  }) {
    try {
      return _deleteProductsRepository.deleteProduct(
        productId: productId,
      );
    } catch (e) {
      rethrow;
    }
  }
}
