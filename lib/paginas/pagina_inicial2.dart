import 'package:flutter/material.dart';
import 'package:julio12/servicios/post_servicio.dart';
import '../filas/fila1.dart';


class PaginaInicial2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaginaInicialEstado2();
  }
}

class PaginaInicialEstado2 extends State<PaginaInicial2> {
  List<String> paises = ['Chile', 'Argentina', 'Peru'];

  @override
  void initState() {
    // no puede ser asincronico
    super.initState();
    cargarDatos(); // llamo a una funcion asincronica
  }

  cargarDatos() async {
    // y esta funcion llama a la funcion asincronica
    paises = await PostServicio.leerpost();
    setState(() {
      // vuelva a dibujar la pagigna
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("titulo")),
        body: ListView.builder(
          itemCount: paises.length,
          itemBuilder: (BuildContext, fila) {
            return Fila1(
              nombrePais: paises[fila],
            );
          },
        ));
  }
}
