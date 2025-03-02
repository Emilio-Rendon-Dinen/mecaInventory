import 'package:meca_inventory/data/data_base/sql_helper.dart';
import 'package:meca_inventory/domain/repositories/add_products_repository.dart';
import 'package:sqflite/sqflite.dart';

class AddProductImplementation implements AddProductsRepository {
  @override
  Future<void> addProduct({
    required String name,
    String? description,
    required int categoryId,
    String? cost,
    String? initialQuantity,
  }) async {
    final database = await SqlHelper.instance.database;

    await database.transaction((txn) async {
      await txn.insert(
        'products',
        {
          'name': name,
          'description': description,
          'cost': cost,
          'initial_quantity': initialQuantity,
          'category_id': categoryId,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }
}

/*
Iniciamos una transacción: Usamos database.transaction para 
ejecutar varias operaciones de forma atómica. 
Esto garantiza que si algo falla, nada se guarda.
Manejo de conflictos: Usamos ConflictAlgorithm.replace para 
reemplazar un producto si hay un conflicto (en caso de que el id ya exista). Puedes ajustar esta estrategia según tus necesidades.*/