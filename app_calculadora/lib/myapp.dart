import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inicio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  final myControllerDos = TextEditingController();

  int _numero = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 270,
                child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),

                      hintText: 'Introduce el primer numero',
                    ))
              )
              ,
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 270,
                child:TextField(
                    controller: myControllerDos,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Introduce el segundo numero',

                    )) ,
              )
              ,
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              _numero = int.parse(myController.text) -
                  int.parse(myControllerDos.text);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(

                    content: Text('El resultado es ${_numero}'),
                  );
                },
              );
              myController.clear();
              myControllerDos.clear();
            },
            heroTag: null,
            tooltip: 'Resta',
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _numero = int.parse(myController.text) +
                  int.parse(myControllerDos.text);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(

                    content: Text('El resultado es ${_numero}'),
                  );
                },
              );
              myController.clear();
              myControllerDos.clear();
              //_incrementCounter();
            },
            heroTag: null,
            tooltip: 'Suma ',
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(Icons.crop_rounded),
            onPressed: (){

              _numero = int.parse(myController.text) *
                  int.parse(myControllerDos.text);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('El resultado es ${_numero}'),
                  );

                },
              );
              myController.clear();
              myControllerDos.clear();
            },

            heroTag: null,
            tooltip: 'Multiplica',
          ),
          const SizedBox(
            height: 10,
          ),

          const SizedBox(
            height: 10,
          ),

          FloatingActionButton(
            onPressed: (){
              double numerinDos=_numero.toDouble();
              numerinDos = double.parse(myController.text) / double.parse(myControllerDos.text);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('El resultado es ${numerinDos}'),
                  );
                },
              );
              myController.clear();
              myControllerDos.clear();
            },
            heroTag: null,
            tooltip: 'Divide',
            child: const Icon(Icons.dnd_forwardslash),
          ),
        ]));
  }
}
