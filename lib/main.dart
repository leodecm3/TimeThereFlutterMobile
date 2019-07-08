import 'package:flutter/material.dart';


// import 'package:flutter_web/material.dart';
import 'package:intl/intl.dart';
// import 'package:timezone/browser.dart';
// import 'package:timezone/timezone.dart';

import "main.dart";
import 'contdownpag.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter - hour in Sydney and Florida'),
    );
  }
}

//
// ----------------- app start ---------------------------------
//

//
// ----------------- functions ---------------------------------
//

//
// ----------------- widgets ---------------------------------
//
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    mudarPagina() {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new SecondScreen()),
      );
    }

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: BodyLayout(),
      ),
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              mudarPagina();
              // Navigator.push(
              //   context,
              //   new MaterialPageRoute(builder: (context) => new SecondScreen()),
              // );
            },
            child: DaysToTripIcon(),
            // child: Text("50days"),
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // adicionaFuturo();
      //   },
      //   child: Text("50days"),
      // ),

      //palhacada para ficar no meio
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         BodyLM()
      //       ],
      //     )
      //   ],
      // )

      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (choose the "Toggle Debug Paint" action
      //     // from the Flutter Inspector in Android Studio, or the "Toggle Debug
      //     // Paint" command in Visual Studio Code) to see the wireframe for each
      //     // widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       BodyLM(),
      //     ],
      //   ),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ------pagina contagem---------------------------------------------------------------------------------------------------------------------------------------------------------------------

class DaysToTripIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _timeAtual = addTimeTop(0, "Sydney", returnDate: true);
    var _timeOfTrip = DateTime.parse("2019-08-06 16:05:04Z");
    var _timeBetween = _timeOfTrip.difference(_timeAtual);
    var _i = _timeBetween.inDays;
    return Container(
      child: Text("$_i" "days"),
    );
  }
}

// ---------fim pagina contagem------------------------------------------------------------------------------------------------------------------------------------------------------------------

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

//com separador
Widget _myListView(BuildContext context) {
  return ListView.separated(
    itemCount: 100,
    controller: ScrollController(initialScrollOffset: 1000),
// controller: ScrollController(initialScrollOffset: 20),
    itemBuilder: (context, index) {
      return ListTile(
        title: LineWithHours(index: index),
        // contentPadding: EdgeInsets.all(0.0),
      );
    },
    // itemBuilder: (context, index) => Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: Center(child: Text("Index $index")),
    //   ),
    separatorBuilder: (context, index) {
      // return Divider(
      //   color: Colors.black,
      //   // indent: 1.0,
      // );
      return Container(
        color: Colors.grey,
        height: 0.5,
      );
    },
  );
}

var timeFromUtcSydney = 10;
var timeFromUtcFlorida = -4;

addTimeTop(_addHours, localzacao, {returnDate = false}) {
  var _nowTime = new DateTime.now().toUtc();

  var _returnAddTime;
  _nowTime = _nowTime.add(new Duration(hours: _addHours));

  if (localzacao == "Sydney") {
    _nowTime = _nowTime.add(new Duration(hours: timeFromUtcSydney));
  }
  ;

  if (localzacao == "Florida") {
    _nowTime = _nowTime.add(new Duration(hours: timeFromUtcFlorida));
  }
  ;
 
  var formatter;
  var formatted;
  //if ask to retur in a tade tipe or formated text
  if (returnDate == false) {
    // returnDate = false
    if (_addHours == 0) {
      formatter = DateFormat('HH:mm');
      formatted = formatter.format(_nowTime);
      _returnAddTime = "$formatted     $_addHours.h";
    } else {
      formatter = DateFormat('HH:00');
      formatted = formatter.format(_nowTime);
      _returnAddTime = "$formatted     $_addHours.h";
    }
  } else {
    // returnDate = true;
    _returnAddTime = _nowTime; //retorna no formato de data
  }

  return _returnAddTime;
}

addTimeBotom(_addHours, localzacao) {
  var _nowTime = new DateTime.now().toUtc();

  var _returnAddTime;
  _nowTime = _nowTime.add(new Duration(hours: _addHours));

  if (localzacao == "Sydney") {
    _nowTime = _nowTime.add(new Duration(hours: timeFromUtcSydney));
  }
  ;

  if (localzacao == "Florida") {
    _nowTime = _nowTime.add(new Duration(hours: timeFromUtcFlorida));
  }
  ;

  var formatter;
  var formatted;

  formatter = new DateFormat('EEE dd');
  formatted = formatter.format(_nowTime);
  _returnAddTime = "$formatted";

  return _returnAddTime;
}

iconeLm(_addHours, localzacao) {
  var _icone;

  if (_addHours == 0) {
    if (localzacao == "Florida") {
      // _icone = Container();
      _icone = Image.asset(
        'assets/direita-usa.jpg',
        scale: 7,
      );
    } else {
      //sydney
      _icone = Image.asset(
        'assets/esquerda-aus.jpg',
        scale: 7,
      );
    }
  } else {
    _icone = Container();
  }

  return _icone;
}

class LineWithHours extends StatelessWidget {
  LineWithHours({this.index});

  minhaFuncao(index) {
    // print("rodou a funcao com $index");
    var _horas = index - 24;
    var texto1Esquerd;
    var texto2Esquerd;
    var texto1Direita;
    var texto2Direita;
    var _corDeFundo;
    if (_horas == 0) {
      _corDeFundo = Colors.red[100];
    } else {
      _corDeFundo = Colors.grey[100];
    }

    texto1Esquerd = addTimeTop(_horas, "Sydney");
    texto2Esquerd = addTimeBotom(_horas, "Sydney");
    texto1Direita = addTimeTop(_horas, "Florida");
    texto2Direita = addTimeBotom(_horas, "Florida");

    // return Text('aa $index');
    return new GestureDetector(
        onTap: () {
          print("Container clicked");
        },
        child: new Container(
          color: _corDeFundo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              iconeLm(_horas, "Sydney"),
              Column(
                // coluna aqui
                children: <Widget>[
                  Text(
                    texto1Esquerd,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    texto2Esquerd,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
              Column(
                // coluna la
                children: <Widget>[
                  Text(
                    texto1Direita,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    texto2Direita,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
              iconeLm(_horas, "Florida"),
            ],
          ),
        ));

    // // container

    // //fim do container
  }

  final index;
  @override
  Widget build(BuildContext context) {
    return minhaFuncao(index);
  }
}

// void mudaPagina() {

//   var context;
//   Navigator.push(
//     context,
//     new MaterialPageRoute(builder: (context) => new SecondScreen()),
//   );
// }
