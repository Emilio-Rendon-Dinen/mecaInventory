// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Meca inventario';

  @override
  String get successDeleteProduct => 'Producto eliminado exitosamente';

  @override
  String get deleteProductError => 'Ocurrio un error al eliminar el producto';

  @override
  String get getProductsError => 'Ocurrio un error al obtener los productos';

  @override
  String get editProductError => 'Ocurrio un error al editar el producto';

  @override
  String get successEditProduct => 'Producto editado exitosamente';

  @override
  String get products => 'Productos';

  @override
  String get add => 'Agregar';

  @override
  String get delete => 'Eliminar';

  @override
  String cardCategory(String category) {
    return 'Categoria: $category';
  }

  @override
  String cardCost(String cost) {
    return 'Costo: $cost';
  }

  @override
  String cardQuantity(int currentQuantity, int initialQuantity) {
    return 'Cantidad: $currentQuantity/$initialQuantity';
  }

  @override
  String get addProducts => 'Agregar productos';

  @override
  String get emptyProducts => 'No hay productos';
}
