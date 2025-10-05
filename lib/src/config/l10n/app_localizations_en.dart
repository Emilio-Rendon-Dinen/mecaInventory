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
  String get successDeleteProduct => 'Product deleted successfully';

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

  @override
  String get delete => 'Delete';

  @override
  String cardCategory(String category) {
    return 'Category: $category';
  }

  @override
  String cardCost(String cost) {
    return 'Cost: $cost';
  }

  @override
  String cardQuantity(int currentQuantity, int initialQuantity) {
    return 'Quantity: $currentQuantity/$initialQuantity';
  }

  @override
  String get addProducts => 'Add products';

  @override
  String get emptyProducts => 'No products available';

  @override
  String get addProductError => 'An error occurred while adding the product';

  @override
  String get addFirstProduct => 'Add your first product';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get buyCost => 'Purchase cost';

  @override
  String get initialQuantity => 'Initial quantity';

  @override
  String get productImage => 'Product image';

  @override
  String get validNumber => 'Please enter a valid number';

  @override
  String get validValue => 'Please enter a valid value';

  @override
  String get validDescription => 'Please enter a description';

  @override
  String get addName => 'Please enter a name';

  @override
  String get selectFromGallery => 'Select from gallery';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get permissionDenied => 'Permission denied';

  @override
  String get errorSelectingImage => 'Error selecting image';

  @override
  String get addProductImage => 'Add product image';
}
