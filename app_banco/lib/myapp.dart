import 'dart:math';

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


class _MyHomePageState extends State<MyHomePage> {
  int _saldo = Random().nextInt(100);
  final _controllerBtnUno= TextEditingController();
  final _controllerBtnDos= TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Bank App"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Saldo Actual:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              '$_saldo €',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Ingresar dinero'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controllerBtnUno,
                        decoration: InputDecoration(hintText: "Cantidad"),

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
                             _saldo+= int.parse(_controllerBtnUno.text);
                             _controllerBtnUno.clear();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ],
                    );
                  },
                );},
              child: Text('Ingresar dinero'),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(

               foregroundColor: Colors.red

              ),
              onPressed: (){

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Retirar Dinero'),
                      content: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controllerBtnDos,
                        decoration: InputDecoration(hintText: "Cantidad"),

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
                              _saldo-= int.parse(_controllerBtnDos.text);
                              _controllerBtnDos.clear();
                              Navigator.pop(context);
                            });
                          },
                        ),


                      ],
                    );
                  },
                );},
              child: Text('Retirar dinero'),
            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(

                content: Text('Aplicación para ingresar o retirar dinero de una cuenta bancaria'),
              );
            },
          );},
        tooltip: 'Info',
        child: const Icon(Icons.info),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
