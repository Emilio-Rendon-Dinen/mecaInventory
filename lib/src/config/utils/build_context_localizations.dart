import 'package:meca_inventory/src/config/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextLocalizations on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}

// Se puede usar ! por que estamos seguros que siempre se usara dentro del arbol de widgets
