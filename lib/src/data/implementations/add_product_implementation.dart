import 'package:meca_inventory/src/data/data_base/sql_helper.dart';
import 'package:meca_inventory/src/data/models/product_model.dart';
import 'package:meca_inventory/src/domain/entities/product.dart';
import 'package:meca_inventory/src/domain/repositories/add_products_repository.dart';
import 'package:sqflite/sqflite.dart';

class AddProductImplementation implements AddProductsRepository {
  @override
  Future<void> addProduct({
    required Product product,
  }) async {
    final database = await SqlHelper.instance.database;

    final productModel = ProductModel.fromProduct(product);

    await database.transaction(
      (txn) async {
        await txn.insert(
          'products',
          {
            'name': productModel.name,
            'description': productModel.description,
            'cost': productModel.cost,
            'initial_quantity': productModel.initialQuantity,
            'current_quantity': productModel.initialQuantity,
            'image': productModel.image,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      },
    );
  }
}

/*
1-Iniciamos una transacción: Usamos database.transaction para 
ejecutar varias operaciones de forma atómica. 
  -Esto garantiza que si algo falla, nada se guarda.
2-Manejo de conflictos: Usamos ConflictAlgorithm.replace para 
reemplazar un producto si hay un conflicto (en caso de que el id ya exista).*/
