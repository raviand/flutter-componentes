import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 100.0;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('Sliders'),
         ),
         body: Container(
           padding: EdgeInsets.only(top: 40.0),
           child: Column(
             
             children: <Widget>[
               _crearSlider(),
               _crearCheckbox(),
               _crearSwitch(),
               Expanded(
                 child: _crearImagen()
                 )
             ],
           )
         ),
       )
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Size ${_value.toInt()}',
      //divisions: 20,
      onChanged: (_checkbox ) ? null : (value){
        print(value);
        setState( () {
          
          _value = value;
          
        });
      },
      value: _value,
      min: 10.0,
      max: 400.0,
    );
  }

  Widget _crearImagen() {

    return FadeInImage(
      image: NetworkImage('https://pbs.twimg.com/profile_images/421917452940083200/casYLh0i.jpeg'),
      width: _value,
      placeholder: AssetImage('assets/jar-loading.gif'),
      fit: BoxFit.contain,
      );

  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _checkbox,
      onChanged: (value ) {
        setState(() {
          _checkbox = !_checkbox;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _checkbox,
      onChanged: (value ) {
        setState(() {
          _checkbox = !_checkbox;
        });
      },
    );
  }
}