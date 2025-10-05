import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Meca inventario'**
  String get appTitle;

  /// No description provided for @successDeleteProduct.
  ///
  /// In es, this message translates to:
  /// **'Producto eliminado exitosamente'**
  String get successDeleteProduct;

  /// No description provided for @deleteProductError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrio un error al eliminar el producto'**
  String get deleteProductError;

  /// No description provided for @getProductsError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrio un error al obtener los productos'**
  String get getProductsError;

  /// No description provided for @editProductError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrio un error al editar el producto'**
  String get editProductError;

  /// No description provided for @successEditProduct.
  ///
  /// In es, this message translates to:
  /// **'Producto editado exitosamente'**
  String get successEditProduct;

  /// No description provided for @products.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get products;

  /// No description provided for @add.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get add;

  /// No description provided for @delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get delete;

  /// Categoria que se muestra en el card de producto
  ///
  /// In es, this message translates to:
  /// **'Categoria: {category}'**
  String cardCategory(String category);

  /// Costo que se muestra en el card de producto
  ///
  /// In es, this message translates to:
  /// **'Costo: {cost}'**
  String cardCost(String cost);

  /// Cantidad actual sobre cantidad inicial que se muestra en el card de producto
  ///
  /// In es, this message translates to:
  /// **'Cantidad: {currentQuantity}/{initialQuantity}'**
  String cardQuantity(int currentQuantity, int initialQuantity);

  /// No description provided for @addProducts.
  ///
  /// In es, this message translates to:
  /// **'Agregar productos'**
  String get addProducts;

  /// No description provided for @emptyProducts.
  ///
  /// In es, this message translates to:
  /// **'No hay productos'**
  String get emptyProducts;

  /// No description provided for @addProductError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrio un error al agregar el producto'**
  String get addProductError;

  /// No description provided for @addFirstProduct.
  ///
  /// In es, this message translates to:
  /// **'Agrega tu primer producto'**
  String get addFirstProduct;

  /// No description provided for @name.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get name;

  /// No description provided for @description.
  ///
  /// In es, this message translates to:
  /// **'Descripcion'**
  String get description;

  /// No description provided for @buyCost.
  ///
  /// In es, this message translates to:
  /// **'Costo de compra'**
  String get buyCost;

  /// No description provided for @initialQuantity.
  ///
  /// In es, this message translates to:
  /// **'Cantidad inicial'**
  String get initialQuantity;

  /// No description provided for @productImage.
  ///
  /// In es, this message translates to:
  /// **'Foto del producto'**
  String get productImage;

  /// No description provided for @validNumber.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa un numero valido'**
  String get validNumber;

  /// No description provided for @validValue.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa un valor valido'**
  String get validValue;

  /// No description provided for @validDescription.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa una descripcion'**
  String get validDescription;

  /// No description provided for @addName.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa un nombre'**
  String get addName;

  /// No description provided for @selectFromGallery.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar de la galeria'**
  String get selectFromGallery;

  /// No description provided for @takePhoto.
  ///
  /// In es, this message translates to:
  /// **'Tomar foto'**
  String get takePhoto;

  /// No description provided for @permissionDenied.
  ///
  /// In es, this message translates to:
  /// **'Permiso denegado'**
  String get permissionDenied;

  /// No description provided for @errorSelectingImage.
  ///
  /// In es, this message translates to:
  /// **'Error al seleccionar la imagen'**
  String get errorSelectingImage;

  /// No description provided for @addProductImage.
  ///
  /// In es, this message translates to:
  /// **'Agregar imagen del producto'**
  String get addProductImage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
