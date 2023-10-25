import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class Cita{
  String fecha="";
  String hora="";
  String paciente="";

  Cita(String f, String h,String p){
    this.fecha=f;
    this.hora=h;
    this.paciente=p;
  }
}




class _MyHomePageState extends State<MyHomePage> {

DateTime dateTime= new DateTime(2023, 10, 1, 8, 0);
List<Cita> elementos=[];
final _controlador= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(

        children: elementos.map((elemento){
          return Card(

            child: Column(

              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                ListTile(

                  title: Text(elemento.paciente),
                  subtitle: Text('${elemento.fecha} \n ${elemento.hora}'),

                ),

              ],
            ),
          );

        }).toList(),


      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Agregar Cita'),
                content:    SizedBox(
                  height: 200,
                
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: dateTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                  setState(() => dateTime=newDateTime);


                    },
                    use24hFormat: true,
                    minuteInterval: 5,
                  ),

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
                        String fecha="${dateTime.day} / ${dateTime.month} / ${dateTime.year} ";
                        String hora="${dateTime.hour} : ${dateTime.minute}";

                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Nombre del Paciente'),
                              content: TextField(
                                decoration: InputDecoration(hintText: "Nombre"),
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
                                  String paciente=_controlador.text;
                                      Cita c= Cita(fecha, hora,paciente);
                                      elementos.add(c);
                                    Navigator.pop(context);
                                    });
                                  },
                                ),


                              ],
                            );
                          },
                        );

                      });
                    },
                  ),


                ],
              );
            },
          );


        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
