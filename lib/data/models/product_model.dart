import 'package:meca_inventory/config/utils/map_extension.dart';
import 'package:meca_inventory/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.description,
    required super.initialQuantity,
    required super.cost,
  });

  /// Constructor nombrado que espera un [Map] con la información de una pelicula y crea una instancia de [Product].

  ProductModel.parse(
    Map<String, dynamic> json,
  ) : super(
            id: json.getInteger('id'),
            categoryId: json.getInteger('category_id'),
            description: json.getString('description'),
            name: json.getString('name'),
            cost: json.getString('cost'),
            initialQuantity: json.getInteger('initial_quantity'));

  /// Parsea un [List] que representa la información de varias peliculas y retorna una lista de instancias de [Product].
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
}
