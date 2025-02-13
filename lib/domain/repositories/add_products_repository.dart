abstract class AddProductsRepository {
  Future<void> addProduct(
    String name,
    String description,
    int categoryId,
  );
}
