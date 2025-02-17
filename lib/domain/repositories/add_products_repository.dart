abstract class AddProductsRepository {
  Future<void> addProduct({
    required String name,
    String? description,
    required int categoryId,
    String? cost,
  });
}
