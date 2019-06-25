import 'dart:io';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Componentes'),
        ),
      body: _lista(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: (){
          exit(0);
        },
      ),

    );
  }

  Widget _lista() {

    return FutureBuilder(
      future:  menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) => ListView( children: _listItems(snapshot.data, context), ),
    );
    

  }

  List<Widget>_listItems(List<dynamic> data, BuildContext context) {
    List <Widget> opciones = [];

    data.forEach( (opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIconFromString(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider(color: Colors.red, height: 2.0,));
    } );
    return opciones;
  }
}