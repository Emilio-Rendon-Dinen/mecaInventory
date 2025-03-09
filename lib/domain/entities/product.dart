class Product {
  final int id;
  final String name;
  final String description;
  final String cost;
  final int categoryId;
  final int initialQuantity;
  final int currentQuantity;

  const Product({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.cost,
    required this.description,
    required this.initialQuantity,
    required this.currentQuantity,
  });
}
