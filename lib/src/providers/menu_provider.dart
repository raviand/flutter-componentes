import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider(){ }

  Future< List<dynamic> > cargarData() async {
    final data = await rootBundle.loadString('tools/menu_opts.json');
    
    Map jsonMap = json.decode(data);
    print(jsonMap['nombreApp']);
    opciones = jsonMap['rutas'];
    print(opciones);
    
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
