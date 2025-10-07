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

  @override
  String get addProductError => 'Ocurrio un error al agregar el producto';

  @override
  String get addFirstProduct => 'Agrega tu primer producto';

  @override
  String get name => 'Nombre';

  @override
  String get description => 'Descripcion';

  @override
  String get buyCost => 'Costo de compra';

  @override
  String get initialQuantity => 'Cantidad inicial';

  @override
  String get productImage => 'Foto del producto';

  @override
  String get validNumber => 'Por favor ingresa un numero valido';

  @override
  String get validValue => 'Por favor ingresa un valor valido';

  @override
  String get validDescription => 'Por favor ingresa una descripcion';

  @override
  String get addName => 'Por favor ingresa un nombre';

  @override
  String get selectFromGallery => 'Seleccionar de la galeria';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get permissionDenied => 'Permiso denegado';

  @override
  String get errorSelectingImage => 'Error al seleccionar la imagen';

  @override
  String get addProductImage => 'Agregar imagen del producto';

  @override
  String get save => 'Guardar';

  @override
  String get enterInventory => 'Ingresar inventario';

  @override
  String currentQuantity(int currentQuantity) {
    return 'Cantidad actual: $currentQuantity';
  }
}
