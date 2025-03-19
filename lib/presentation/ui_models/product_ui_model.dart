import 'dart:typed_data';

import 'package:meca_inventory/domain/entities/product.dart';

class ProductUIModel {
  final int? id;
  final String name;
  final String description;
  final String cost;
  final int categoryId;
  final int initialQuantity;
  final int? currentQuantity;
  final Uint8List? image;
  final bool hasImage;

  const ProductUIModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.cost,
    required this.description,
    required this.initialQuantity,
    this.currentQuantity,
    this.image,
    this.hasImage = false,
  });

  factory ProductUIModel.fromDomain(Product product) {
    return ProductUIModel(
      id: product.id,
      name: product.name,
      description: product.description,
      cost: product.cost,
      initialQuantity: product.initialQuantity,
      currentQuantity: product.currentQuantity,
      categoryId: product.categoryId,
      image: product.image,
      hasImage: product.image.isNotEmpty,
    );
  }

  Product toDomain() {
    return Product(
      id: id ?? 0,
      name: name,
      description: description,
      cost: cost,
      initialQuantity: initialQuantity,
      currentQuantity: currentQuantity ?? initialQuantity,
      categoryId: categoryId,
      image: image ?? Uint8List(0),
    );
  }

  String get quantityStatus {
    final qty = currentQuantity ?? initialQuantity;

    if (qty <= 0) return 'Sin stock';
    if (qty < initialQuantity * 0.2) return 'Stock crítico';
    if (qty < initialQuantity * 0.5) return 'Stock bajo';
    return 'Stock disponible';
  }
}
