import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:julio12/modelo/post.dart';

class PostServicio {
  static Future<List<String>> leerpost() async {
    // https://jsonplaceholder.typicode.com/posts
    List<String> paises = [];
    //await Future.delayed(const Duration(seconds:3));
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts', {});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // response.body ---> List<Dynamic> ---> List<String>

      // var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      paises = jsonResponse.map((e) => e['title'].toString()).toList();

      /*for(int i=0;i<jsonResponse.length;i++) {
        paises.add(jsonResponse[i]['title']);
      }*/

      print('conexion exitosa');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return paises;
  }

  static Future<List<Post>> leerpost2() async {
    // https://jsonplaceholder.typicode.com/posts
    List<Post> paises = [];

    var url = Uri.https('jsonplaceholder.typicode.com', '/posts', {});
    //await Future.delayed(const Duration(seconds:3));
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // response.body ---> List<Dynamic> ---> List<String>

      // var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      paises = jsonResponse.map((e) => Post.desdeMapa(e)).toList();

      /*for(int i=0;i<jsonResponse.length;i++) {
        paises.add(jsonResponse[i]['title']);
      }*/

      print('conexion exitosa');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return paises;
  }

  static Future<Post> leerpostsimple(int idPost) async {
    // https://jsonplaceholder.typicode.com/posts/22
    Post post=Post(0,0,"","");

    var url = Uri.https('jsonplaceholder.typicode.com', '/posts/$idPost', {});
    //await Future.delayed(const Duration(seconds:3));
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // response.body ---> List<Dynamic> ---> List<String>

      // var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonResponse = convert.jsonDecode(response.body) as Map<String,dynamic>;

      post = Post.desdeMapa(jsonResponse);

      /*for(int i=0;i<jsonResponse.length;i++) {
        post.add(jsonResponse[i]['title']);
      }*/

      print('conexion exitosa');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return post;
  }
}
