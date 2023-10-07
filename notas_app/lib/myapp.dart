import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class Nota{
    String titulo="";
    String contenido="";

    Nota(String t, String c){
      this.titulo=t;
      this.contenido=c;
    }
}


class _MyHomePageState extends State<MyHomePage> {

  final _controlador= TextEditingController();
List<Nota> elementos=[];
var _contador =1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Notas App"),
      ),

      body: Column(

        children: elementos.map((elemento){
          return Card(

            child: Column(

              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                 ListTile(

                  title: Text('Nota ${elemento.titulo}'),
                  subtitle: Text(elemento.contenido),
                ),

              ],
            ),
          );

        }).toList(),


      ),

      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
      tooltip: "Añadir nota",
       onPressed:(){
         showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
               title: Text('Añadir Nota'),
             content: TextField(
             decoration: InputDecoration(hintText: "Introduce nota"),
             controller: _controlador,
             ),

             actions: <Widget>[
                 MaterialButton(
                   color: Colors.red,
                   textColor: Colors.white,
                   child: Text('Cancelar'),
                   onPressed: () {
                     setState(() {
                       Navigator.pop(context);
                     });
                   },
                 ),

                 MaterialButton(
                   color: Colors.green,
                   textColor: Colors.white,
                   child: Text('Confirmar'),

                   onPressed: () {

                     setState(() {

                       Nota n = Nota(_contador.toString(),_controlador.text);
                    elementos.add(n);
                       Navigator.pop(context);
                       _controlador.clear();
                       _contador++;

                     });
                   },
                 ),


               ],
             );
           },
         );
       } ,

     ),

     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
