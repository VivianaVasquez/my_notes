//Viviana Katherine Vásquez Fonseca
//Grupo 1 Desarrollo de Aplicaciones híbridas Nivel 1
//PROYECTO FINAL

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
      title: 'MyNotesApp',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mi nota final'),
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
  final _note1 = TextEditingController();
  final _percent1 = TextEditingController();
  final _note2 = TextEditingController();
  final _percent2 = TextEditingController();
  final _note3 = TextEditingController();
  final _percent3 = TextEditingController();
  final _note4 = TextEditingController();
  final _percent4 = TextEditingController();
  final _note5 = TextEditingController();
  final _percent5 = TextEditingController();
  final _note6 = TextEditingController();
  final _percent6 = TextEditingController();
  final _note7 = TextEditingController();
  final _percent7 = TextEditingController();
  double _calculatenote1=0;
  double _calculatenote2=0;
  double _calculatenote3=0;
  double _calculatenote4=0;
  double _calculatenote5=0;
  double _calculatenote6=0;
  double _calculatenote7=0;
  double _notefinal = 0;
  String _notefinal2 = '';
  String _message = '';
  String _message2 = '';
  int _band=2;
  int validator = 0;
  double _percentfinal = 0;
  void _initialization() {
    setState(() {
      _calculatenote1 = 0;
      _calculatenote2 = 0;
      _calculatenote3 = 0;
      _calculatenote4 = 0;
      _calculatenote5 = 0;
      _calculatenote6 = 0;
       _calculatenote7 = 0;
      _notefinal = 0;
      _notefinal2 = '';
      _message = '';
      _message2 = '';
      _band = 2;
      _percentfinal=0;

    });
  }
  void _calculateNote() {
    setState(() {
      _calculatenote1 =
      (double.parse(_note1.text) * (double.parse(_percent1.text) / 100));
      if(double.parse(_note1.text)<0 || double.parse(_note1.text)>5) validator=1;
      _calculatenote2 =
      (double.parse(_note2.text) * (double.parse(_percent2.text) / 100));
      _percentfinal = double.parse(_percent1.text)+double.parse(_percent2.text);
      if(double.parse(_note2.text)<0 || double.parse(_note2.text)>5) validator=1;
      if(_band>=3) {
        _calculatenote3 =
        (double.parse(_note3.text) * (double.parse(_percent3.text) / 100));
        _percentfinal = _percentfinal+double.parse(_percent3.text);
        if(double.parse(_note3.text)<0 || double.parse(_note3.text)>5) validator=1;
      }
      if(_band>=4) {
        _calculatenote4 =
        (double.parse(_note4.text) * (double.parse(_percent4.text) / 100));
        _percentfinal = _percentfinal+double.parse(_percent4.text);
        if(double.parse(_note4.text)<0 || double.parse(_note4.text)>5) validator=1;
      }
      if(_band>=5) {
        _calculatenote5 =
        (double.parse(_note5.text) * (double.parse(_percent5.text) / 100));
        _percentfinal = _percentfinal+double.parse(_percent5.text);
        if(double.parse(_note5.text)<0 || double.parse(_note5.text)>5) validator=1;
      }
      if(_band>=6) {
        _calculatenote6 =
        (double.parse(_note6.text) * (double.parse(_percent6.text) / 100));
        _percentfinal = _percentfinal+double.parse(_percent6.text);
        if(double.parse(_note6.text)<0 || double.parse(_note6.text)>5) validator=1;
      }
      if(_band==7) {
        _calculatenote7 =
        (double.parse(_note7.text) * (double.parse(_percent7.text) / 100));
        _percentfinal = _percentfinal+double.parse(_percent7.text);
        if(double.parse(_note7.text)<0 || double.parse(_note7.text)>5) validator=1;
      }
      if (_band==2){
        _notefinal = _calculatenote1 + _calculatenote2;
      }
      else if (_band==3){
        _notefinal = _calculatenote1 + _calculatenote2 + _calculatenote3 ;
      }
      else if (_band==4){
        _notefinal = _calculatenote1 + _calculatenote2 + _calculatenote3 + _calculatenote4;
      }
      else if(_band==5){
        _notefinal = _calculatenote1 + _calculatenote2 + _calculatenote3 + _calculatenote4 + _calculatenote5;
      }
      else if(_band==6){
        _notefinal = _calculatenote1 + _calculatenote2 + _calculatenote3 + _calculatenote4 + _calculatenote5 + _calculatenote6;
      }
      else{
        _notefinal = _calculatenote1 + _calculatenote2 + _calculatenote3 + _calculatenote4 + _calculatenote5 + _calculatenote6 + _calculatenote7;
      }

      _notefinal2 = _notefinal.toStringAsPrecision(3);

      if ((_notefinal < 3)&&(_percentfinal==100)) {
        _message = 'Lo siento, perdiste la materia';
      }
      else if ((_notefinal >= 3)&&(_percentfinal==100)) {
        _message = 'Felicitaciones, ganaste la materia';
      }
      else{
        _message2 = 'IMPORTANTE: Los porcentajes deben sumar el 100%';
      }
    });
  }
    void _incrementband() {
      setState(() {
        _band++;
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(
          Icons.school,
        ),
        title: Text(
          textAlign: TextAlign.center,
          widget.title,
        ),

      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:10,vertical:12),

        child: Center(
          child: Column(
            children: <Widget>[

              const Row(
                children: <Widget>[
                  Text(
                    'Nota',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                  ),
                  Text(
                    'Porcentaje (%)',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _note1,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese la primer nota: '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _percent1,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese el porcentaje: '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _note2,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese la segunda nota: '),
                      keyboardType: TextInputType.number,

                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _percent2,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese el porcentaje: '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              if (_band>=3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _note3,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese la tercer nota: '),
                        keyboardType: TextInputType.number,

                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _percent3,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese el porcentaje: '),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              if (_band>=3)
                const SizedBox(
                  height: 10.0,
                ),
              if(_band>=4)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _note4,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese la cuarta nota: '),

                        keyboardType: TextInputType.number,

                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _percent4,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese el porcentaje: '),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              if(_band>=4)
                const SizedBox(
                  height: 10.0,
                ),
              if (_band >= 5)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _note5,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese la quinta nota: '),

                        keyboardType: TextInputType.number,

                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _percent5,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese el porcentaje: '),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              if (_band >= 5)
                const SizedBox(
                  height: 10.0,
                ),
              if(_band>=6)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _note6,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese la sexta nota: '),

                        keyboardType: TextInputType.number,

                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _percent6,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese el porcentaje: '),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              if(_band>=6)
                const SizedBox(
                  height: 10.0,
                ),
              if(_band>=7)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: _note7,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese la séptima nota: '),

                        keyboardType: TextInputType.number,

                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _percent7,
                        decoration:const InputDecoration(
                            border:OutlineInputBorder(),
                            labelText: 'Ingrese el porcentaje: '),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              if(_band>=7)
                const SizedBox(
                  height: 10.0,
                ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16),
                  backgroundColor: Colors.blueAccent[200],
                ),
                onPressed: (){
                  if(_band<=7) _incrementband();
                },
                child: const Text(
                  "Agregar nota",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16),
                      backgroundColor: Colors.teal[200],
                    ),
                    onPressed: (){
                      validator=0;
                      _calculateNote();
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16),
                      backgroundColor: Colors.deepPurpleAccent[100],
                    ),
                    onPressed: (){
                      _initialization();
                    },
                    child: const Text(
                      "Resetear",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20.0,
              ),
                if(validator==0 && _percentfinal==100)
                  Text(
                    'Tu nota final es: $_notefinal2',
                    style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              if(validator==0)
                Text(
                    '$_message',
                    style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      backgroundColor: Colors.green,
                    ),
                  ),
              if((_percentfinal != 100))
                Text(
                  '$_message2',
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
              if(validator==1)
                const Text(
                  'IMPORTANTE: Las notas deben estar entre 0 y 5',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
