import 'package:flutter/material.dart';

final _icons = <String, IconData> {
  'add_alert' :  Icons.add_alert ,
  'accessibility' :  Icons.accessibility ,
  'folder_open' :  Icons.folder_open ,
  'dounut_large' : Icons.donut_large,
  'input' : Icons.input
};

Icon getIconFromString(String iconName){


  return Icon(_icons[iconName], color: Colors.lightBlue,);
}