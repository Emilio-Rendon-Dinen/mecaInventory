import 'package:meca_inventory/src/data/data_base/sql_helper.dart';
import 'package:meca_inventory/src/data/models/product_model.dart';
import 'package:meca_inventory/src/domain/entities/product.dart';
import 'package:meca_inventory/src/domain/repositories/get_products_repository.dart';

/// Clase que maneja la comunicación con la base de datos para  ontener un listado de[Product].
///
/// Esta clase pide todos los registros de productos de la base de datos
class GetProductsImplementation implements GetProductsRepository {
  @override
  Future<List<Product>> getProducts() async {
    final database = await SqlHelper.instance.database;
    final data = await database.rawQuery('SELECT * FROM products');
    return ProductModel.parseToList(data);
  }
}
