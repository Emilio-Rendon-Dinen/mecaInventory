import 'dart:typed_data';

class Product {
  final int id;
  final String name;
  final String description;
  final String cost;
  final int initialQuantity;
  final int currentQuantity;
  final Uint8List image;

  const Product({
    required this.id,
    required this.name,
    required this.cost,
    required this.description,
    required this.initialQuantity,
    required this.currentQuantity,
    required this.image,
  });
}
