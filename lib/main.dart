import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
