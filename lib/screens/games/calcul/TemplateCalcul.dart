import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tage_boost/widgets/CustomBottomNavigationBar.dart';
import 'package:tage_boost/themes/global.dart';

typedef CreateContentQuestion = String Function(int q1, int q2);
typedef CreateAnswer = int Function(int q1, int q2);


class TemplateCalculGame extends StatefulWidget {
    final int min;
    final int max;
    final CreateContentQuestion createContentQuestion;
    final CreateAnswer createAnswer;

    const TemplateCalculGame({
        Key? key,
        required this.min,
        required this.max,
        required this.createContentQuestion,
        required this.createAnswer,
    });
    @override
    _TemplateCalculGameState createState() => _TemplateCalculGameState();
}

class _TemplateCalculGameState extends State<TemplateCalculGame> {

    int _q1 = 0;
    int _q2 = 0;

    bool _show = false;
    int _answer = 0;

    String _question = '';

    void _generateQuestion() {
        setState(() { 
            _q1 = Random().nextInt(widget.max - widget.min) + widget.min;
            _q2 = Random().nextInt(widget.max - widget.min) + widget.min;
            _question = widget.createContentQuestion(_q1, _q2);
            _answer = widget.createAnswer(_q1, _q2);
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
                    _question,
                    style: TextStyle(
                    fontSize: padding * 2,
                    fontWeight: FontWeight.bold,
                    color: PrimaryColor,
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
                        primary: PrimaryColor,
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

class TemplateCalcul extends StatelessWidget {
    final int min;
    final int max;
    final String text;
    final CreateContentQuestion createContentQuestion;
    final CreateAnswer createAnswer;

    const TemplateCalcul(
        {
            Key? key, 
            required this.min, 
            required this.max, 
            required this.text, 
            required this.createContentQuestion,
            required this.createAnswer,
        })
        : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(text),
                backgroundColor: PrimaryColor,
            ),
        body: Center(
            child: TemplateCalculGame(
                min: min,
                max: max,
                createContentQuestion: createContentQuestion,
                createAnswer: createAnswer,
                ),
            ),
        bottomNavigationBar: CustomBottomNavigationBar(),
        );
    }
}
