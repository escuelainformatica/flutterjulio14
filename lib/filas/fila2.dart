import 'package:flutter/material.dart';
import 'package:julio12/modelo/post.dart';
import 'package:julio12/servicios/post_servicio.dart';

// widget
class Fila2 extends StatefulWidget {
  // String campo
  Post nombrePais;

  Fila2({Key? key, required this.nombrePais}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Fila2Estado();
  }
}

// estado (aqui hacemos el trabajo)
class Fila2Estado extends State<Fila2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          Post post = await PostServicio.leerpostsimple(widget.nombrePais.id);

          var snackBar = SnackBar(
            content: Text(post.title),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(widget.nombrePais.title),
                  leading: Text(widget.nombrePais.id.toString()),
                  subtitle: Text(widget.nombrePais.body),
                ))));
  }
}
