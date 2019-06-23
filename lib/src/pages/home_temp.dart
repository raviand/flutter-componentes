import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
         children: _crearItemsCorto()
      ),
      );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt),);
      lista..add(tempWidget)
            ..add(Divider(color: Colors.red));
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){
    var widgets = opciones.map( ( opt ) { 
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt),
            subtitle: Text('Cualquier Cosa'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
            onLongPress: (){},
          ),
          Divider(color: Colors.green, )
        ],
      );
      } ).toList();
    return widgets;
  }


}