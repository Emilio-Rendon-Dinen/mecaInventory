import 'package:flutter/material.dart';

enum StockStatus {
  fullStock,
  lowStock,
  criticStock,
  emptyStock,
}

extension StockStatusExtension on StockStatus {
  String get stringValue {
    switch (this) {
      case StockStatus.fullStock:
        return "Stock disponible";
      case StockStatus.lowStock:
        return "Stock bajo";
      case StockStatus.criticStock:
        return "Stock crítico";
      case StockStatus.emptyStock:
        return "Sin stock";
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
