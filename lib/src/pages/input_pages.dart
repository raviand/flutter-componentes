import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _seleccion = 'volar';
  List<String> _poderes = ['volar', 'Rayos X', 'Super Fuerza', 'Super Aliento'];


  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs de texto'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(
              height: 5.0,
            ),
            _crearEmail(),
            Divider(
              height: 5.0,
            ),
            _crearPassword(),
            Divider(
              height: 5.0,
            ),
            _crearFecha(context),
            Divider(
              height: 5.0,
            ),
            _crearDropdown(),
            Divider(
              height: 5.0,
            ),
            _crearPersona()
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        print(_name);
      },
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_name.length}'),
          hintText: 'Nombre...',
          labelText: 'Nombre',
          helperText: 'Solo el nombre',
          suffixIcon: Icon(Icons.person),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Bienvenido $_name'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _email = value;
        });
        print(_email);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email...',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
    );
  }

  Widget _crearPassword() {
    return TextField(
      onChanged: (value) {
        setState(() {
          _password = value;
        });

      },
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password...',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
    );
  }

  Widget _crearFecha( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha...',
          labelText: 'Fecha',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );
  }

  _selectDate(context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );

    if(picked != null){
      setState(() {
       _fecha = picked.toLocal().toString(); 
       _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach( (opt) => lista.add( new DropdownMenuItem<String>(
      child: Text( opt),
      value: opt,
      )));
    
    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton(
      items: getOpcionesDropdown(),
      value: _seleccion,
      onChanged: (value){
        setState(() {
          _seleccion = value;
        });
        print(value);
      },
    );
  }
}
