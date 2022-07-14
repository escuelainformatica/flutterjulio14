import 'package:flutter/material.dart';

// widget
class Fila1 extends StatefulWidget {
  // String campo
  String nombrePais;

  Fila1({Key? key,required this.nombrePais}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Fila1Estado();
  }

}
// estado (aqui hacemos el trabajo)
class Fila1Estado extends State<Fila1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(widget.nombrePais),
      )
    );
  }

}