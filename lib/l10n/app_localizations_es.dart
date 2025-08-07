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
  String get delete => 'Eliminar';

  @override
  String get category => 'Categoría';

  @override
  String get cost => 'Costo';

  @override
  String get quantity => 'Cantidad';

  @override
  String currentQuantity(Object current, Object total) {
    return 'Actual: $current/$total';
  }

  @override
  String get products => 'Productos';

  @override
  String get add => 'Agregar';

  @override
  String get deleteProduct => 'Producto eliminado correctamente';
}
