import 'package:meca_inventory/data/data_base/sql_helper.dart';
import 'package:meca_inventory/data/models/product_model.dart';
import 'package:meca_inventory/domain/entities/product.dart';
import 'package:meca_inventory/domain/repositories/edit_product_repository.dart';

class EditProductImplementation implements EditProductRepository {
  @override
  Future<void> editProduct({required Product product}) async {
    final ProductModel productModel = ProductModel.fromProduct(product);
    final database = await SqlHelper.instance.database;

    await database.transaction((txn) async {
      await txn.update(
        'products',
        productModel.toMap(),
        where: 'id = ?',
        whereArgs: [product.id],
      );
    });
  }
}
