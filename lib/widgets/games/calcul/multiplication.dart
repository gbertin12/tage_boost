import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';

class MultiplicationGame extends StatefulWidget {
  const MultiplicationGame({Key? key}) : super(key: key);
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
      _q1 = Random().nextInt(10) + 1;
      _q2 = Random().nextInt(10) + 1;
      _answer = _q1 * _q2;
      _show = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_q1 x $_q2',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 20),
        if (_show)
          Text(
            '$_answer',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          )
        else
          Text(
            '?',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        SizedBox(height: 40),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            _show ? 'Nouvelle Question' : 'Révéler la Réponse',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class Multiplication extends StatelessWidget {
  const Multiplication({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplication Game'),
      ),
      body: Center(
        child: MultiplicationGame(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Multiplication(),
    theme: ThemeData(primaryColor: Colors.blue),
  ));
}
