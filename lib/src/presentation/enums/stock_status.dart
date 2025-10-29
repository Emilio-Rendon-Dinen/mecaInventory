import 'package:flutter/material.dart';
import 'package:meca_inventory/src/config/utils/build_context_localizations.dart';

enum StockStatus {
  fullStock,
  lowStock,
  criticStock,
  emptyStock,
}

extension StockStatusExtension on StockStatus {
  String stringValue(BuildContext context) {
    switch (this) {
      case StockStatus.fullStock:
        return context.strings.availableStock;
      case StockStatus.lowStock:
        return context.strings.lowStock;
      case StockStatus.criticStock:
        return context.strings.criticalStock;
      case StockStatus.emptyStock:
        return context.strings.outOfStock;
    }
  }

  Color get colorValue {
    switch (this) {
      case StockStatus.fullStock:
        return Colors.green;
      case StockStatus.lowStock:
        return Colors.orange;
      case StockStatus.criticStock:
        return Colors.red;
      case StockStatus.emptyStock:
        return Colors.black;
    }
  }
}
