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
  String get delete => 'Delete';

  @override
  String get category => 'Category';

  @override
  String get cost => 'Cost';

  @override
  String get quantity => 'Quantity';

  @override
  String currentQuantity(int current, int total) {
    return 'Current: $current/$total';
  }
}
