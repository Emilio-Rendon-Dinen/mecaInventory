import 'dart:typed_data';

import 'package:meca_inventory/src/config/utils/map_extension.dart';
import 'package:meca_inventory/src/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.initialQuantity,
    required super.cost,
    required super.currentQuantity,
    required super.image,
  });

  /// Constructor nombrado que espera un [Map] con la información de un producto y crea una instancia de [Product].

  ProductModel.parse(
    Map<String, dynamic> json,
  ) : super(
          id: json.getInteger('id'),
          description: json.getString('description'),
          name: json.getString('name'),
          cost: json.getString('cost'),
          initialQuantity: json.getInteger('initial_quantity'),
          currentQuantity: json.getInteger('current_quantity'),
          image: Uint8List.fromList(List<int>.from(json['image'] ?? [])),
        );

  /// Parsea un [List] que representa la información de varios productos y retorna una lista de instancias de [Product].
  ///
  /// Si la data proporcionado es `null`, se devuelve una lista vacía.
  static List<Product> parseToList(dynamic json) {
    final List<Product> list = [];

    if (json is List) {
      // Si el json ya es una lista
      for (final element in json) {
        if (element is Map<String, dynamic>) {
          final Product item = ProductModel.parse(element);
          list.add(item);
        }
      }
    } else if (json is Map<String, dynamic>) {
      // Si el json es un solo objeto
      final Product item = ProductModel.parse(json);
      list.add(item);
    }

    return list;
  }

  /// Convierte un [Product] en un [ProductModel] y asi seguir con las reglas de la clean architecture
  ProductModel.fromProduct(Product product)
      : super(
          id: product.id,
          name: product.name,
          description: product.description,
          cost: product.cost,
          initialQuantity: product.initialQuantity,
          currentQuantity: product.currentQuantity,
          image: product.image,
        );

  /// Convierte el [ProductModel] en un [Map<String, dynamic>]
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'cost': cost,
      'initial_quantity': initialQuantity,
      'current_quantity': currentQuantity,
      'image': image,
    };
  }
}
