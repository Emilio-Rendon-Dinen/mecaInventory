import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meca_inventory/config/dependency_injection/get_it.dart';
import 'package:meca_inventory/config/material_theme.dart';
import 'package:meca_inventory/l10n/app_localizations.dart';
import 'package:meca_inventory/presentation/screens/home/home_screen.dart';
import 'package:meca_inventory/config/create_text_theme.dart';

void main() {
  getItConfiguration();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    //Este código sirve para personalizar y configurar el estilo de texto global de la aplicación
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const HomeScreen(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales
    );
  }
}
