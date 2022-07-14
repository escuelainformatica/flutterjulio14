import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaginaInicialEstado();
  }
}

class PaginaInicialEstado extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("titulo")),
      body: ListView(
        children: [Text("Chile"),Text("Argentina"),Text("Peru")],
      )
    );
  }

}