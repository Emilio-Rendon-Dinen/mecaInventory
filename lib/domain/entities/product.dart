class Product {
  final int id;
  final String name;
  final String description;
  final int categoryId;

  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
  });
}
