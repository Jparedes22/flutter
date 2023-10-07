import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Noticias API',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Noticia {
  String title = "";
  String descripcion = "";
Image img=Image.network("https://picsum.photos/200/300");
  Noticia(String t, String d,Image i) {
    this.title = t;
    this.descripcion = d;
    this.img=i;
  }
}
var intValue = Random().nextInt(150);


Image img = Image.network("https://picsum.photos/200/300");
class _MyHomePageState extends State<MyHomePage> {
  List<Noticia> lista = [];

  Future<void> getNoticias() async {
    // final response = await http.get(Uri.https('newsapi.org','v2/top-headlines?country=us&category=business&apiKey=06a65f8df531426f9f84ccff3eaf13a3'));
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        lista.clear();

        /* for (var i=0; i<data.length; i++) {

         final noticiaPedida= Noticia(data.articles[i].title, data.articles[i].description);
          dataList.add(noticiaPedida); 
        } */

        for (var noticia in data) {
          final noticiaPedida =
              Noticia(noticia["id"].toString(), noticia["title"],Image.network("https://picsum.photos/id/$intValue/200/300"));
          lista.add(noticiaPedida);
        }
      });
    } else {
      setState(() {
        lista.clear();
        lista.add(Noticia("0", "Error en la llamada",Image.network("https://picsum.photos/200/300")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Noticias API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                getNoticias();
              },
              child: Text('Obtener Noticias'),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (BuildContext context, int index) {
                   
                  return Card(
                   
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: lista[index].img,
                          title: Text('Noticia ${lista[index].title}'),
                          subtitle: Text(lista[index].descripcion),
                        ),
                      ],
                    ),
                  );
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
