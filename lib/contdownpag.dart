import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import "main.dart";
import 'contdownpag.dart';

// class DaysToTrip extends StatefulWidget {
//   @override
//   _DaysToTripState createState() => _DaysToTripState();
// }

// class _DaysToTripState extends State<DaysToTrip> {
//   var _i;
//   var _timeAtual;
//   var _timeOfTrip;
//   var _timeBetween;

//   var _timeBetweeninDays;
//   var _timeBetweeninHours;
//   var _timeBetweeninMinutes;
//   var _timeBetweeninSeconds;

//   adicionacontadorDentroDoState() {
//     setState(() {
//       _timeAtual = addTimeTop(0, "Sydney", returnDate: true);
//       _timeOfTrip = DateTime.parse("2019-08-06 16:05:04Z");
//       _timeBetween = _timeOfTrip.difference(_timeAtual);

//       // _i = _timeOfTrip - _timeAtual;
//       _i = _timeBetween.inDays;

//       _timeBetweeninDays = _timeBetween.inDays;
//       _timeBetweeninHours = _timeBetween.inHours;
//       _timeBetweeninMinutes = _timeBetween.inMinutes;
//       _timeBetweeninSeconds = _timeBetween.inSeconds;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     adicionacontadorDentroDoState();
//     return Container(
//         child: Row(
//       children: <Widget>[
//         Text("$_timeBetweeninDays" "Days  :"),
//         Text("$_timeBetweeninHours" "hours  :"),
//         Text("$_timeBetweeninMinutes" "minutes  :"),
//         Text("$_timeBetweeninSeconds" "Seconds   "),
//       ],
//     ));
//   }
// }

// ------pagina contagem---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//https://github.com/josancamon19/flutter_countdown_timer/tree/master/lib

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count down days"),
      ),
      // body: new Home(),
      body: DaysToTrip(),
      // body: new Text("sdes"),
    );
  }
}

class DaysToTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return dayLista(context);
  }
}

Widget dayLista(BuildContext context) {
  return ListView.separated(
    itemCount: 100,
    controller: ScrollController(initialScrollOffset: 0),
// controller: ScrollController(initialScrollOffset: 20),
    itemBuilder: (context, index) {
      return ListTile(
        // title: LineWithDays(index: index),
        title: LineWithDays(index: index),
        // contentPadding: EdgeInsets.all(0.0),
      );
    },
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

class LineWithDays extends StatelessWidget {
  LineWithDays({this.index});
  minhaFuncao(index) {
    // print("rodou a funcao com $index");
    var _timeOfTrip = DateTime.parse("2019-08-06 16:05:04Z");

    var _diasARemover = -index;

    _timeOfTrip = _timeOfTrip.add(new Duration(days: _diasARemover));

    var formatter;
    var formatted;
    var _returnDate;

    formatter = new DateFormat('EEE dd MMM');
    formatted = formatter.format(_timeOfTrip);
    _returnDate = "$formatted";

    int diffDays = _timeOfTrip.difference(new DateTime.now()).inDays;

// print(diffDays);

    var _corDeFundo;
    if (diffDays < 0) {
      //
      //ja passou
      _corDeFundo = Colors.blue[500];
      return Container(
        color: _corDeFundo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              "$_returnDate",
              style: new TextStyle(
                color: Colors.blueGrey[700],
                decoration: TextDecoration.lineThrough,
              ),
            ),
            new Text(
              "$index Days",
              style: new TextStyle(
                color: Colors.blueGrey[700],
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      );
      //
    } else if (diffDays == 0) {
      //
      //dia atual
      _corDeFundo = Colors.blue[100];
      return Container(
        color: _corDeFundo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("$_returnDate"),
            new Text("$index Days"),
          ],
        ),
      );
      //
    } else {
      //
      //ainda falta
      _corDeFundo = Colors.grey[100];
      return Container(
        color: _corDeFundo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text("$_returnDate"),
            new Text("$index Days"),
          ],
        ),
      );
      //
    }
  }

  final index;
  @override
  Widget build(BuildContext context) {
    return minhaFuncao(index);
  }
}

//
//
//
//
//
//
//
//
//
// -------------------anterior
//
//
//
//
//
//
//
//
//
//

//
//
//
//
//
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController animationController;

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitDays = twoDigits(duration.inDays.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours.remainder(60));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitDays $twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String get timerString {
    Duration duration =
        animationController.duration * animationController.value;
    var txtDuration;
    // txtDuration = '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    txtDuration = _printDuration(duration);

    print(txtDuration);
    return txtDuration;
  }

  var _timeBetween;

  @override
  void initState() {
    super.initState();

    _timeBetween = DateTime.parse("2019-08-06 16:05:04Z")
        .difference(addTimeTop(0, "Sydney", returnDate: true));
    _timeBetween = _timeBetween.inSeconds;

    // _DaysToTripState.adicionacontadorDentroDoState._timeBetween;
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: _timeBetween));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                  animation: animationController,
                                  backgroundColor: Colors.white,
                                  color: Theme.of(context).accentColor),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Count Down",
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            AnimatedBuilder(
                                animation: animationController,
                                builder: (_, Widget child) {
                                  return Text(
                                    timerString,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.display4,
                                  );
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                        animation: animationController,
                        builder: (_, Widget child) {
                          return Icon(
                            animationController.isAnimating
                                ? Icons.pause
                                : Icons.play_arrow,
                          );
                        }),
                    onPressed: () {
                      if (animationController.isAnimating) {
                        animationController.stop();
                      } else {
                        animationController.reverse(
                          from: animationController.value == 0.0
                              ? 1.0
                              : animationController.value,
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * 3.141592;
    // double progress = (1.0 - animation.value) * 2 * PI;
    canvas.drawArc(Offset.zero & size, 3.141592 * 1.5, -progress, false, paint);
    // canvas.drawArc(Offset.zero & size, PI * 1.5, -progress, false, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
