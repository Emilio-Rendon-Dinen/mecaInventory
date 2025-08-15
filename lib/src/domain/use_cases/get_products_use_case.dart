import 'package:meca_inventory/src/domain/entities/product.dart';
import 'package:meca_inventory/src/domain/repositories/get_products_repository.dart';

class GetProductsUseCase {
  final GetProductsRepository _getProductsRepository;
  const GetProductsUseCase(this._getProductsRepository);

  Future<List<Product>> getProducts() {
    try {
      return _getProductsRepository.getProducts();
    } catch (e) {
      rethrow;
    }
  }
}
