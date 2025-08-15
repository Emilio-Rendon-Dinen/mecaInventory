import 'dart:convert';

/// Extensiones para objetos tipo Map
extension MapExtensions on Map<dynamic, dynamic> {
  /// Convierte el objeto [Map] a un String. Si [useIndent] es true, devuelve un String en formato json, caso
  /// contrario, devuelve un String plano.
  ///
  /// Si ocurrió un error en el proceso, devuelve un String vacío.
  String parse({
    bool useIndent = false,
  }) {
    if (useIndent) {
      try {
        return const JsonEncoder.withIndent('  ').convert(this);
      } catch (_) {
        return parse();
      }
    }

    try {
      return jsonEncode(this);
    } catch (_) {
      return '';
    }
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [Map].
  bool hasMap(String key) => containsKey(key) && this[key] is Map;

  /// Devuelve el valor tipo [Map] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [Map], devuelve el valor de [defaultValue].
  Map<dynamic, dynamic> getMap(
    String key, {
    Map<dynamic, dynamic> defaultValue = const {},
  }) {
    if (!hasMap(key)) {
      return defaultValue;
    }

    return this[key] as Map;
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [Map] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [Map], devuelve el valor de [defaultValue].
  Map<dynamic, dynamic> getMapIfOne(
    List<String> keys, {
    Map<dynamic, dynamic> defaultValue = const {},
  }) {
    for (var key in keys) {
      if (hasMap(key)) {
        return this[key] as Map;
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [Map] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [Map], devuelve null.
  Map<dynamic, dynamic>? tryGetMap(String key) {
    if (!hasMap(key)) {
      return null;
    }

    return this[key] as Map;
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [Map] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [Map], devuelve null.
  Map<dynamic, dynamic>? tryGetMapIfOne(List<String> keys) {
    for (var key in keys) {
      if (hasMap(key)) {
        return this[key] as Map;
      }
    }

    return null;
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [List].
  bool hasList(String key) => containsKey(key) && this[key] is List;

  /// Devuelve el valor tipo [List] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [List], devuelve el valor de [defaultValue].
  List<dynamic> getList(
    String key, {
    List<dynamic> defaultValue = const [],
  }) {
    if (!hasList(key)) {
      return defaultValue;
    }

    return this[key] as List;
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [List] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [List], devuelve el valor de [defaultValue].
  List<dynamic> getListIfOne(
    List<String> keys, {
    List<dynamic> defaultValue = const [],
  }) {
    for (var key in keys) {
      if (hasList(key)) {
        return this[key] as List;
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [List] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [List], devuelve null.
  List<dynamic>? tryGetList(String key) {
    if (!hasList(key)) {
      return null;
    }

    return this[key] as List;
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [List] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [List], devuelve null.
  List<dynamic>? tryGetListIfOne(List<String> keys) {
    for (var key in keys) {
      if (hasList(key)) {
        return this[key] as List;
      }
    }

    return null;
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [String].
  bool hasString(String key) => containsKey(key) && this[key] is String;

  /// Devuelve el valor tipo [String] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea
  /// de tipo [String], devuelve el valor de [defaultValue].
  String getString(
    String key, {
    String defaultValue = '',
  }) {
    if (_isNumber(key)) {
      return '${this[key]}';
    }

    if (!hasString(key)) {
      return defaultValue;
    }

    return _getStringKeyValue(key);
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [String] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [String], devuelve el valor de [defaultValue].
  String getStringIfOne(
    List<String> keys, {
    String defaultValue = '',
  }) {
    for (var key in keys) {
      if (_isNumber(key)) {
        return '${this[key]}';
      }

      if (hasString(key)) {
        return _getStringKeyValue(key);
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [String] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea
  /// de tipo [String], devuelve null.
  String? tryGetString(String key) {
    if (_isNumber(key)) {
      return '${this[key]}';
    }

    if (!hasString(key)) {
      return null;
    }

    return _getStringKeyValue(key);
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [String] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [String], devuelve null.
  String? tryGetStringIfOne(List<String> keys) {
    for (final key in keys) {
      if (_isNumber(key)) {
        return '${this[key]}';
      }

      if (hasString(key)) {
        return _getStringKeyValue(key);
      }
    }

    return null;
  }

  String _getStringKeyValue(String key) => '${this[key]}'.replaceAll('\u0000', '');

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [int].
  bool hasInteger(
    String key, {
    int? moreThan,
    int? differentThan,
  }) {
    if (moreThan != null) {
      containsKey(key) && int.tryParse(this[key].toString()) != null && int.parse(this[key].toString()) > moreThan;
    }

    if (differentThan != null) {
      containsKey(key) && int.tryParse(this[key].toString()) != null && int.parse(this[key].toString()) != differentThan;
    }

    return containsKey(key) && int.tryParse(this[key].toString()) != null;
  }

  /// Devuelve el valor tipo [int] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [int], devuelve el valor de [defaultValue].
  int getInteger(
    String key, {
    int defaultValue = 0,
    int? moreThan,
    int? differentThan,
  }) {
    if (!hasInteger(key, moreThan: moreThan, differentThan: differentThan)) {
      return defaultValue;
    }

    return int.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [int] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [int], devuelve el valor de [defaultValue].
  int getIntegerIfOne(
    List<String> keys, {
    int defaultValue = 0,
    int? moreThan,
    int? differentThan,
  }) {
    for (final key in keys) {
      if (hasInteger(key, moreThan: moreThan, differentThan: differentThan)) {
        return int.parse(this[key].toString());
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [int] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [int], devuelve null.
  int? tryGetInteger(
    String key, {
    int? moreThan,
    int? differentThan,
  }) {
    if (!hasInteger(key, moreThan: moreThan, differentThan: differentThan)) {
      return null;
    }

    return int.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [int] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [int], devuelve null.
  int? tryGetIntegerIfOne(
    List<String> keys, {
    int? moreThan,
    int? differentThan,
  }) {
    for (final key in keys) {
      if (hasInteger(key, moreThan: moreThan, differentThan: differentThan)) {
        return int.parse(this[key].toString());
      }
    }

    return null;
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [double].
  bool hasDouble(
    String key, {
    double? moreThan,
    double? differentThan,
  }) {
    if (moreThan != null) {
      return containsKey(key) && double.tryParse(this[key].toString()) != null && double.parse(this[key].toString()) > moreThan;
    }

    if (differentThan != null) {
      return containsKey(key) && double.tryParse(this[key].toString()) != null && double.parse(this[key].toString()) != differentThan;
    }

    return containsKey(key) && double.tryParse(this[key].toString()) != null;
  }

  /// Devuelve el valor tipo [double] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea
  /// de tipo [double], devuelve el valor de [defaultValue].
  double getDouble(
    String key, {
    double defaultValue = 0.0,
    double? moreThan,
    double? differentThan,
  }) {
    if (!hasDouble(key, moreThan: moreThan, differentThan: differentThan)) {
      return defaultValue;
    }

    return double.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [double] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [double], devuelve el valor de [defaultValue].
  double getDoubleIfOne(
    List<String> keys, {
    double defaultValue = 0.0,
    double? moreThan,
    double? differentThan,
  }) {
    for (final key in keys) {
      if (hasDouble(key, moreThan: moreThan, differentThan: differentThan)) {
        return double.parse(this[key].toString());
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [double] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea
  /// de tipo [double], devuelve null.
  double? tryGetDouble(
    String key, {
    double? moreThan,
    double? differentThan,
  }) {
    if (!hasDouble(key, moreThan: moreThan, differentThan: differentThan)) {
      return null;
    }

    return double.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [double] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [double], devuelve null.
  double? tryGetDoubleIfOne(
    List<String> keys, {
    double? moreThan,
    double? differentThan,
  }) {
    for (final key in keys) {
      if (hasDouble(key, moreThan: moreThan, differentThan: differentThan)) {
        return double.parse(this[key].toString());
      }
    }

    return null;
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [bool].
  bool hasBoolean(String key) => containsKey(key) && bool.tryParse(this[key].toString()) != null;

  /// Devuelve el valor tipo [bool] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [bool], devuelve el valor de [defaultValue].
  bool getBoolean(
    String key, {
    bool defaultValue = false,
    dynamic equalTo,
    dynamic greaterThan,
    dynamic greaterEqualThan,
    dynamic smallerThan,
    dynamic smallerEqualThan,
    dynamic differentOf,
  }) {
    if (_isNumber(key)) {
      return _isBooleanNumber(
        this[key],
        equalTo,
        greaterThan,
        greaterEqualThan,
        smallerThan,
        smallerEqualThan,
        differentOf,
      );
    }

    if (hasString(key)) {
      return _isBooleanString(
        this[key].toString().toLowerCase(),
        equalTo,
        differentOf,
      );
    }

    if (!hasBoolean(key)) {
      return defaultValue;
    }

    return bool.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [bool] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [bool], devuelve el valor de [defaultValue].
  bool getBooleanIfOne(
    List<String> keys, {
    bool defaultValue = false,
    dynamic equalTo,
    dynamic greaterThan,
    dynamic greaterEqualThan,
    dynamic smallerThan,
    dynamic smallerEqualThan,
    dynamic differentOf,
  }) {
    for (final key in keys) {
      if (_isNumber(key)) {
        return _isBooleanNumber(
          this[key],
          equalTo,
          greaterThan,
          greaterEqualThan,
          smallerThan,
          smallerEqualThan,
          differentOf,
        );
      }

      if (hasString(key)) {
        return _isBooleanString(
          this[key] as String,
          equalTo,
          differentOf,
        );
      }

      if (hasBoolean(key)) {
        return bool.parse(this[key].toString());
      }
    }

    return defaultValue;
  }

  /// Devuelve el valor tipo [bool] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no sea de
  /// tipo [bool], devuelve null.
  bool? getTryBoolean(
    String key, {
    dynamic equalTo,
    dynamic greaterThan,
    dynamic greaterEqualThan,
    dynamic smallerThan,
    dynamic smallerEqualThan,
    dynamic differentOf,
  }) {
    if (_isNumber(key)) {
      return _isBooleanNumber(
        this[key],
        equalTo,
        greaterThan,
        greaterEqualThan,
        smallerThan,
        smallerEqualThan,
        differentOf,
      );
    }

    if (hasString(key)) {
      return _isBooleanString(
        this[key].toString().toLowerCase(),
        equalTo,
        differentOf,
      );
    }

    if (!hasBoolean(key)) {
      return null;
    }

    return bool.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [bool] que encuentre. En caso de no
  /// existir ningún valor para [keys] o que ningún valor sea de tipo [bool], devuelve null.
  bool? tryGetBooleanIfOne(
    List<String> keys, {
    dynamic equalTo,
    dynamic greaterThan,
    dynamic greaterEqualThan,
    dynamic smallerThan,
    dynamic smallerEqualThan,
    dynamic differentOf,
  }) {
    for (final key in keys) {
      if (_isNumber(key)) {
        return _isBooleanNumber(
          this[key],
          equalTo,
          greaterThan,
          greaterEqualThan,
          smallerThan,
          smallerEqualThan,
          differentOf,
        );
      }

      if (hasString(key)) {
        return _isBooleanString(
          this[key] as String,
          equalTo,
          differentOf,
        );
      }

      if (hasBoolean(key)) {
        return bool.parse(this[key].toString());
      }
    }

    return null;
  }

  /// Devuelve [true] en caso de que exista el valor de [key] y sea de tipo [DateTime].
  bool hasDateTime(String key) => containsKey(key) && DateTime.tryParse(this[key].toString()) != null;

  /// Devuelve el valor tipo [DateTime] de [key]. En caso de no existir el valor de [key] o que el valor de [key] no
  /// sea de tipo [DateTime], devuelve el valor de [defaultValue].
  DateTime? getDateTime(
    String key, {
    DateTime? defaultValue,
  }) {
    if (!hasDateTime(key)) {
      return defaultValue;
    }

    return DateTime.parse(this[key].toString());
  }

  /// Realiza una búsqueda de valores para [keys] y devuelve el primer valor tipo [DateTime] que encuentre. En caso de
  /// no existir ningún valor para [keys] o que ningún valor sea de tipo [DateTime], devuelve el valor de
  /// [defaultValue].
  DateTime? getDateTimeIfOne(
    List<String> keys, {
    DateTime? defaultValue,
  }) {
    for (final key in keys) {
      if (hasDateTime(key)) {
        return getDateTime(key);
      }
    }

    return defaultValue;
  }

  bool _isNumber(String key) => containsKey(key) && (this[key] is int || this[key] is double);

  bool _isBooleanNumber(
    dynamic value,
    dynamic equalTo,
    dynamic greaterThan,
    dynamic greaterEqualThan,
    dynamic smallerThan,
    dynamic smallerEqualThan,
    dynamic differentOf,
  ) {
    if (value is! num) {
      return false;
    }
    if (equalTo != null && (equalTo is num)) {
      return value == equalTo;
    }

    if (greaterThan != null && (greaterThan is num)) {
      return value > greaterThan;
    }

    if (greaterEqualThan != null && (greaterEqualThan is num)) {
      return value >= greaterEqualThan;
    }

    if (smallerThan != null && (smallerThan is num)) {
      return value < smallerThan;
    }

    if (smallerEqualThan != null && (smallerEqualThan is num)) {
      return value <= smallerEqualThan;
    }

    if (differentOf != null && (differentOf is num)) {
      return value != differentOf;
    }

    return value == 1;
  }
}

bool _isBooleanString(
  String value,
  dynamic equalTo,
  dynamic differentOf,
) {
  value = value.toLowerCase();

  if (equalTo != null && equalTo is String) {
    return value == equalTo.toLowerCase();
  }

  if (differentOf != null && differentOf is String) {
    return value != differentOf.toLowerCase();
  }

  return value == 'yes' || value == 'si' || value == 'sí' || value == 'true';
}
