import 'package:meca_inventory/data/data_base/sql_helper.dart';
import 'package:meca_inventory/data/models/product_model.dart';
import 'package:meca_inventory/domain/entities/product.dart';
import 'package:meca_inventory/domain/repositories/edit_product_repository.dart';
import 'package:sqflite/sqflite.dart';

class EditProductImplementation implements EditProductRepository {
  @override
  Future<Product> editProduct({
    required Product product,
  }) async {
    final ProductModel productModel = ProductModel.fromProduct(product);
    final database = await SqlHelper.instance.database;

    await database.transaction(
      (txn) async {
        await txn.update(
          'products',
          productModel.toMap(),
          where: 'id = ?',
          whereArgs: [product.id],
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );

    //Siempre se devuelve una lista
    final List<Map<String, dynamic>> maps = await database.query(
      'products',
      where: 'id = ?',
      whereArgs: [product.id],
    );
    final firstMap = maps.firstOrNull;

    if (firstMap != null) {
      return ProductModel.parse(firstMap);
    }
    return product;
  }
}
