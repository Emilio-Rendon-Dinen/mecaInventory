import 'package:meca_inventory/data/data_base/sql_helper.dart';
import 'package:meca_inventory/domain/repositories/delete_products_repository.dart';

class DeleteProductImplementation implements DeleteProductsRepository {
  @override
  Future<void> deleteProduct({required int productId}) async {
    final database = await SqlHelper.instance.database;

    await database.transaction((txn) async {
      await txn.delete(
        'products',
        where: 'id = ?',
        whereArgs: [productId],
      );
    });
  }
}

/// El ? es un marcador de posición que se utiliza para 
/// hacer consultas SQL más seguras y 
/// evitar problemas de inyección de SQL.
///  El valor que reemplaza el ? se pasa como un
///  parámetro dentro de whereArgs.