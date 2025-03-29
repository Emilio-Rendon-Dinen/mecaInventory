import 'package:get_it/get_it.dart';
import 'package:meca_inventory/data/implementations/add_product_implementation.dart';
import 'package:meca_inventory/data/implementations/delete_product_implementation.dart';
import 'package:meca_inventory/data/implementations/edit_product_implementation.dart';
import 'package:meca_inventory/data/implementations/get_products_implementation.dart';
import 'package:meca_inventory/domain/repositories/add_products_repository.dart';
import 'package:meca_inventory/domain/repositories/delete_products_repository.dart';
import 'package:meca_inventory/domain/repositories/edit_product_repository.dart';
import 'package:meca_inventory/domain/repositories/get_products_repository.dart';
import 'package:meca_inventory/domain/use_cases/add_product_use_case.dart';
import 'package:meca_inventory/domain/use_cases/delete_product_use_case.dart';
import 'package:meca_inventory/domain/use_cases/edit_product_use_case.dart';
import 'package:meca_inventory/domain/use_cases/get_products_use_case.dart';
part 'get_it_use_case.dart';
part 'get_it_repository.dart';

final GetIt _getIt = GetIt.instance;

/// Configura las dependencias de la aplicación
void getItConfiguration() {
  _setupRepository();
  _setupUseCase();
}

final GetIt getIt = _getIt;
