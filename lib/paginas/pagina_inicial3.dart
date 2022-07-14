import 'package:flutter/material.dart';
import 'package:julio12/modelo/post.dart';
import 'package:julio12/servicios/post_servicio.dart';
import '../filas/fila2.dart';


class PaginaInicial3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaginaInicialEstado3();
  }
}

class PaginaInicialEstado3 extends State<PaginaInicial3> {
  List<Post> paises = [];

  @override
  void initState() {
    // no puede ser asincronico
    super.initState();
    cargarDatos(); // llamo a una funcion asincronica
  }

  cargarDatos() async {
    // y esta funcion llama a la funcion asincronica
    paises = await PostServicio.leerpost2();
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
            return Fila2(
              nombrePais: paises[fila],
            );
          },
        ));
  }
}
