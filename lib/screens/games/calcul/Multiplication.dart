import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';

class MultiplicationGame extends StatefulWidget {
  final int min;
  final int max;

  const MultiplicationGame({
    Key? key,
    required this.min,
    required this.max,
  });
  @override
  _MultiplicationGameState createState() => _MultiplicationGameState();
}

class _MultiplicationGameState extends State<MultiplicationGame> {
  int _q1 = 0;
  int _q2 = 0;

  bool _show = false;
  int _answer = 0;

  void _generateQuestion() {
    setState(() {
      _q1 = Random().nextInt(widget.max - widget.min) + widget.min;
      _q2 = Random().nextInt(widget.max - widget.min) + widget.min;
      _answer = _q1 * _q2;
      _show = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_q1 x $_q2',
          style: TextStyle(
            fontSize: padding * 2,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: padding),
        if (_show)
          Text(
            '$_answer',
            style: TextStyle(
              fontSize: padding * 2,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          )
        else
          Text(
            '?',
            style: TextStyle(
              fontSize: padding * 2,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        SizedBox(height: padding * 2),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_show) {
                _generateQuestion();
                _show = false;
              } else {
                _show = true;
              }
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: padding, vertical: padding / 2),
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding / 2),
            ),
          ),
          child: Text(
            _show ? 'Nouvelle Question' : 'Révéler la Réponse',
            style: TextStyle(fontSize: padding / 2),
          ),
        ),
      ],
    );
  }
}

class Multiplication extends StatelessWidget {
  final int min;
  final int max;
  final String text;

  const Multiplication(
      {Key? key, required this.min, required this.max, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: MultiplicationGame(
          min: min,
          max: max,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
