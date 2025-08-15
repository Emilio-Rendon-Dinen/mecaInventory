import 'package:flutter/material.dart';

class Navigation {
  static void pop({required BuildContext context}) {
    return Navigator.pop(context);
  }

  static Future<dynamic> push({required BuildContext context, required Widget screen}) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static Future<dynamic> pushAndRemoveUntil({required BuildContext context, required Widget screen}) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false, // Eliminar todas las pantallas anteriores
    );
  }
}
