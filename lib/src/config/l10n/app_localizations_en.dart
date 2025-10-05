// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Meca Inventory';

  @override
  String get deleteProductError =>
      'An error occurred while deleting the product';

  @override
  String get getProductsError =>
      'An error occurred while retrieving the products';

  @override
  String get editProductError => 'An error occurred while editing the product';

  @override
  String get successEditProduct => 'Product edited successfully';

  @override
  String get products => 'Products';

  @override
  String get add => 'Add';
}
